#include "cwktask.h"

const QString g_ipaddr[] = {"http://42.51.15.75/api.html?orderid=463641853318528&getnum=1&filterip=on",
                            "http://218.77.97.176:8888/proxy/api.php?doPost=getip&tid=444328808918528&num=1&reget=0&allport=1&provider=%E4%B8%8D%E9%99%90&splitstr=%7BLR%7D",
                            "http://www.geo521.com/api.asp?dd=443950327328528&tqsl=1&sxa=&sxb=&tta=&ktip=&ports=1998&ports=18186&ports=8080&ports=9999&qt=1"};

//加载成功百分比
const int Load_Success_Percent = 70;

CWkTask::CWkTask()
{
    cwl_.clear();
    sources_.clear();
    rf_ = false;
    stopflow_ = false;

    idle_ = true;
    pvperip_ = 0;
    st_ = 1;
    ctime_ = QTime::currentTime();
    Totaltao_ = 0;

    timer_ = new QTimer;
    timer_->setSingleShot(true);
    connect(timer_, SIGNAL(timeout()), this, SLOT(slotLoadTimeout()));

    proxy_ = QNetworkProxy::HttpProxy;


    QString srcRegion_[Province_Count] = {"上海","江苏","浙江","安徽","江西","广东",
                                          "福建","广西","海南","北京","天津","河北",
                                          "山东","河南","山西","内蒙古","湖北","湖南",
                                          "四川","重庆","贵州","云南","西藏","辽宁",
                                          "吉林","黑龙江","陕西","甘肃","宁夏","青海",
                                          "新疆","台湾","香港","澳门","国外"};

    connect(this, SIGNAL(sigLoadFirst()), this, SLOT(slotLoadFirst()), Qt::QueuedConnection);
    connect(this, SIGNAL(sigLoadNext()), this, SLOT(slotLoadNext()), Qt::QueuedConnection);

    initView();

    //不自动加载图片！
    //view_->settings()->setAttribute(QWebSettings::AutoLoadImages, false);
    //view_->settings()->setAttribute(QWebSettings::JavascriptEnabled, true);
    /* QWebSettings::setMaximumPagesInCache(0);
    QWebSettings::setObjectCacheCapacities(0, 0, 0);
    QWebSettings::setOfflineStorageDefaultQuota(0);
    QWebSettings::setOfflineWebApplicationCacheQuota(0);
    WebCore::memoryCache()->setDisabled(true);
    */
}

void CWkTask::initView()
{
    view_ = new QWebView;
    mainnm_ = new QNetworkAccessManager;
    connect(view_, SIGNAL(loadFinished(bool)), this, SLOT(slotLoadFinished(bool)), Qt::QueuedConnection);
    connect(view_, SIGNAL(loadProgress(int)), this, SLOT(slotp(int)));
    connect(view_ , SIGNAL(loadStarted()), this, SLOT(slotLoadStart()));

    //cksj_ = new QNetworkCookieJar;
    //mainnm_.setCookieJar(&cksj_);
    //mainnm_->setProxy(proxy_);
    view_->page()->setNetworkAccessManager(mainnm_);
}

void CWkTask::freeView()
{
    view_->settings()->clearMemoryCaches();
    view_->settings()->clearIconDatabase();
    disconnect(view_, SIGNAL(loadFinished(bool)), this, SLOT(slotLoadFinished(bool)));
    disconnect(view_, SIGNAL(loadProgress(int)), this, SLOT(slotp(int)));
    disconnect(view_ , SIGNAL(loadStarted()), this, SLOT(slotLoadStart()));
    delete view_;
    delete mainnm_;
    //view_->deleteLater();
    //mainnm_->deleteLater();
    //evl_.processEvents();
}

void CWkTask::reView()
{
    freeView();
    initView();
}

CWkTask::~CWkTask()
{
    // pthread_->quit();
    //pthread_->wait();
    //delete pthread_;
    //delete pview_;
    //delete pel_;
    delete timer_;
    //delete view_;
    //delete cksj_;
}

void CWkTask::slotLoadStart()
{
    timer_->start(10 * 1000);
}

void CWkTask::slotLoadTimeout()
{
    view_->stop();
    emit sigLoadFirst();
}

void CWkTask::initTaoNeed()
{
    QSqlQuery query;
    QString str = QString("select * from slider where taskid = %1").arg(GetTaskId());
    query.exec(str);
    while(query.next())
    {
        for(int i = 0; i < 24; ++i)
        {
            tt_[i].nNeed = (query.value(i+1).toInt() / st_);
            //qDebug()<<"nNeed"<<tt_[i].nNeed;
            tt_[i].nTaoed = 0;
        }
    }
}

void CWkTask::pvStay()
{
    switch (tattr_.nPVstay)
    {
    case 1:
        QTimer::singleShot(GetRandom(10, 15) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
    case 2:
        QTimer::singleShot(GetRandom(20, 30) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
    case 3:
        QTimer::singleShot(GetRandom(30, 45) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
    case 4:
        QTimer::singleShot(GetRandom(45, 60) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
    case 5:
        QTimer::singleShot(GetRandom(90, 120) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
        //随机
    default:
        QTimer::singleShot(GetRandom(3, 10) * 1000,
                           this, SLOT(slotLoadNext()));
        break;
    }
}

void CWkTask::updateTaoed()
{
    QSqlQuery query;
    QString str = QString("select now from flow_task where taskid=%1").arg(tattr_.nTaskId);
    query.exec(str);
    query.next();
    int nTaoed = query.value(0).toInt();
    nTaoed++;
    str = QString("update flow_task set now=%1 where taskid = %2").arg(nTaoed).arg(tattr_.nTaskId);
    query.exec(str);
    ctime_ = QTime::currentTime();
    tt_[ctime_.hour()].nTaoed++;
    Totaltao_++;

    qDebug()<<"taoed::"<<ctime_.hour()<<"::"<<tt_[ctime_.hour()].nTaoed<<tt_[ctime_.hour()].nNeed * tattr_.nIP_PV_Ratio;

    if(tt_[ctime_.hour()].nTaoed >= (tt_[ctime_.hour()].nNeed * tattr_.nIP_PV_Ratio))
    {
        stopflow_ = true;
    }
}

void CWkTask::ResetCookies()
{
    /* if(cksj_ != NULL)
    {
        delete cksj_;
        cksj_ = NULL;
    }*/
    ncs_.clear();
    cksj_.setAllCookies(ncs_);
    //view_->page()->networkAccessManager()->setCookieJar(cksj_);
}

void CWkTask::slotLoadFinished(bool ok)
{
    qDebug()<<"load ,,,,,,"<<ok;
    if(Load_Success_Percent <= lpt_)
    {
        updateTaoed();
    }

    if(ok)
    {
        timer_->stop();
        cp_ = view_->url();
        //IP/PV比例
        if(PvIpSet())
        {
            emit sigLoadFirst();
            return;
        }
        if(stopflow_)
        {
            stopflow_ = false;
            return;
        }

        //initSubLink();
        pvStay();

    }
    // else
    // {
    //changeAgent();
    //view_->reload();
    //emit sigLoadFirst();
    //  }

}

void CWkTask::slotp(int p)
{
    // qDebug()<<p;
    lpt_ = p;
}

void CWkTask::SetProxyIp(QString & hostIp, quint16 & port)
{
    //QNetworkAccessManager manager;

    int rd = GetRandom(0, 1);
    QString netaddr = g_ipaddr[0];

    QNetworkAccessManager gpnm;
    QEventLoop evl;
    connect(&gpnm, SIGNAL(finished(QNetworkReply*)), &evl, SLOT(quit()));
    QNetworkReply *reply = gpnm.get(QNetworkRequest(QUrl(netaddr)));
    evl.exec();       //block until finish

    if (reply->error() == QNetworkReply::NoError)
    {
        // read data from QNetworkReply here
        QString responseData = QString::fromUtf8(reply->readAll());
        int pos1 = 0, pos2 = 0;
        pos1 = responseData.indexOf(":");
        hostIp = responseData.mid(0, pos1);
        pos2 = responseData.indexOf("\r");
        port = responseData.mid(pos1+1, pos2).toUShort();
    }
    // Some http error received
    else
    {
        // handle errors here
    }

    //disconnect(&gpnm, SIGNAL(finished(QNetworkReply*)), &evl, SLOT(quit()));
    reply->deleteLater();
    //.processEvents();
}

bool CWkTask::IsIpValid(QString & ip)
{
    QRegExp rx2 ("((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-4]|[01]?\\d\\d?)");
    //QRegExp rx2((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))));
    if( !rx2.exactMatch(ip) )
    {
        //qDebug()<<"false..............";
        return false;
    }
    //qDebug()<<"true.......................";
    return true;
}

bool CWkTask::changeAgent()
{
    SetProxyIp(proxyip_, proxyport_);
    qDebug()<<QString("current proxy : %1:%2").arg(proxyip_).arg(proxyport_);
    if(!IsIpValid(proxyip_))
    {
        return false;
    }
    //ResetCookies();
    proxy_.setHostName(proxyip_);
    proxy_.setPort(proxyport_);

    mainnm_->setProxy(proxy_);
    //view_->page()->setNetworkAccessManager(&mainnm_);
    return true;
}

bool CWkTask::PvIpSet()
{
    //IP/PV比例
    //随机
    if(0 >= tattr_.nIP_PV_Ratio)
    {
        tattr_.nIP_PV_Ratio = GetRandom(1, MAX_IP_PV_RADIO);
    }

    if(pvperip_ >= tattr_.nIP_PV_Ratio)
    {
        pvperip_ = 0;
        return true;
    }
    else
    {
        pvperip_++;
        return false;
    }
    //return false;
}

QUrl CWkTask::GetRandomRef()
{
    QSqlQuery query;
    QString str = QString("select max(rid) from referrer_random");
    query.exec(str);
    query.next();
    int maxid = query.value(0).toInt();
    int randomid = GetRandom(1, maxid);
    str = QString("select rcontent from referrer_random where rid = %1").arg(randomid);
    query.exec(str);
    query.next();
    QString url = query.value(0).toString();
    return QUrl(url);
}

void CWkTask::loadUrl(QNetworkRequest &rq, QUrl &ref)
{
    rq.setRawHeader("Referer", ref.toEncoded());
    //QMutexLocker locker(&ml_);
    view_->load(rq);
    //view_->show();
    //emit sigLoadFirst();
    //pvStay();
    //int a = 0;
    //a++;
}

QUrl CWkTask::GetCustomRef()
{
    if(sources_.isEmpty())
    {
        QSqlQuery query;
        QString str = QString("select l_content from source_custom where taskid = %1").arg(tattr_.nTaskId);
        query.exec(str);
        while(query.next())
        {
            str = query.value(0).toString();
            if(str.contains("http://"))
            {
                sources_.append(str);
            }
        }
    }

    if(sources_.isEmpty())
    {
        return QUrl("");
    }
    int rand = GetRandom(0, sources_.size() - 1);
    return QUrl(sources_.at(rand));
}

QUrl CWkTask::GetBatchRef()
{
    if(sources_.isEmpty())
    {
        QSqlQuery query;
        QString str = QString("select plset from source_batch where taskid =%1").arg(tattr_.nTaskId);
        query.exec();
        query.next();
        str = query.value(0).toString();
        int pos1 = 0, pos2 = 0;
        pos1 = str.indexOf(",");
        while((pos1 != -1) && (pos2 != -1))
        {
            pos2 = str.indexOf(",", pos1+1);
            sources_.append(str.mid(pos1, pos2));
            pos1 = pos2;
        }
    }
    if(sources_.isEmpty())
    {
        return QUrl("");
    }
    int rand = GetRandom(0, sources_.size() - 1);
    return QUrl(sources_.at(rand));
}

void CWkTask::loadbyRefferer(QUrl url, bool isFirstTime)
{
    rq.setUrl(url);

    if(!isFirstTime)
    {
        ref = cp_;
        loadUrl(rq, ref);
        return;
    }

    //来路
    switch(tattr_.nSourceMode)
    {
    //停用
    default:
        view_->load(url);
        //view_->show();
        break;
        //随机
    case 2:
        ref = GetRandomRef();
        loadUrl(rq, ref);
        break;
        //自定义
    case 3:
        ref = GetCustomRef();
        loadUrl(rq, ref);
        break;
        //批量
    case 4:
        ref = GetBatchRef();
        loadUrl(rq, ref);
        break;
    }

}

//多网址着陆
void CWkTask::MultyEntry()
{
    QString str;
    switch(tattr_.nMulEntryMode)
    {
    //停用
    default:
        loadbyRefferer(QUrl(tattr_.strNetAddr), true);
        break;
        //自动
    case 2:
        if(sublinks_.isEmpty())
        {
            loadbyRefferer(QUrl(tattr_.strNetAddr), true);
        }
        else
        {
            str = GetRandomSubLink();
            if("" == str)
            {
                loadbyRefferer(tattr_.strNetAddr, true);
            }
            loadbyRefferer(QUrl(str), true);
        }
        break;
        //自定义
    case 3:
        break;
        //批量
    case 4:
        break;
    }
}

void CWkTask::slotLoadFirst()
{
    //if(Totaltao_ % 50 == 0)
    //{
    QEventLoop evl;

    reView();
    evl.processEvents();
    //}
    qDebug()<<"First started..";

    //changeAgent();
    /*  if(!changeAgent())
    {
        emit sigLoadFirst();
        return;
    }*/

    //ResetCookies();
    MultyEntry();
}

//点击网址
void CWkTask::ClickSubLink()
{
    QString sl;
    switch(tattr_.nClickMode)
    {
    //随机
    default:
        if(sublinks_.isEmpty())
        {
            emit sigLoadFirst();
            /*
            qDebug()<<"cp_:::::::"<<cp_;
            loadbyRefferer(QUrl(tattr_.strNetAddr), false);
            */
        }
        else
        {
            sl = GetRandomSubLink();
            if("" == sl)
            {
                emit sigLoadFirst();
                break;
            }
            loadbyRefferer(QUrl(sl), false);
        }
        break;
        //关闭
    case 1:
        emit sigLoadFirst();
        break;
        //自定义
    case 3:

        break;
        //完全自定义路径
    case 4:
        break;
    }
}

void CWkTask::slotLoadNext()
{
    ClickSubLink();
}

void CWkTask::dowork()
{
    initTaoNeed();
    tattr_.strMainKey = GetMainKeyByUrl(tattr_.strNetAddr);

    emit sigLoadFirst();
}

void CWkTask::initSubLink()
{
    if((1 == tattr_.nMulEntryMode) && (1 == tattr_.nClickMode))
    {
        return;
    }

    sublinks_.clear();

    QWebFrame* frame = view_->page()->currentFrame();
    if(frame != NULL)
    {
        QWebElementCollection wec = frame->findAllElements("a");
        qDebug()<<"links count : "<<wec.count();
        for(int i = 0; i < wec.count(); ++i)
        {
            if(wec.at(i).attribute("href").contains("http://") &&
                    (wec.at(i).attribute("href").contains(tattr_.strMainKey))
                    && (wec.at(i).attribute("href") != tattr_.strNetAddr)
                    && (wec.at(i).attribute("href") != cp_.toString()))
            {
                sublinks_.append(wec.at(i).attribute("href"));
            }
        }
    }
}

void CWkTask::GetWhiteClickList()
{
    //获取白名单
    if(cwl_.isEmpty())
    {
        QSqlQuery query;
        QString str = QString("select b_content from forbids where taskid = %1").arg(tattr_.nTaskId);
        query.exec(str);
        while(query.next())
        {
            cwl_.append(query.value(0).toString());
        }
    }
}

QString CWkTask::GetRandomSubLink()
{    
    GetWhiteClickList();
    int rd = GetRandom(0, sublinks_.size() - 1);
    if(cwl_.isEmpty())
    {
        return sublinks_.at(rd);
    }
    //点击白名单
    for(int i = 0; i < cwl_.size(); ++i)
    {
        if(sublinks_.at(rd).contains(cwl_.at(i)))
        {
            return "";
        }
    }
    return sublinks_.at(rd);
}

void CWkTask::SetST(int st)
{
    st_ = st;
}

bool CWkTask::Getidel()
{
    return idle_;
}

void CWkTask::Setidle(bool idle)
{
    idle_ = idle;
}

TTaskAttribute & CWkTask::GetTaskAttr()
{
    return tattr_;
}

bool CWkTask::isRunFinished()
{
    return rf_;
}

int CWkTask::GetTaskId()
{
    return tattr_.nTaskId;
}

