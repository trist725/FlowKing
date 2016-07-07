#include "mainwindow.h"
#include "ui_mainwindow.h"

//#include <windows.h>
#include "MyFunc.h"

#define TASKTIMEWAIT 5*1000
#define TOTALIP_PER_DAY 3000
#define MAX_IPPV_RADIO 4
#define MAX_RELOAD_TIME 5
#define MAX_RANDOM_LINK 30
#define TAO_SLEEP_STEP 5

unsigned int g_nUsedIp = 0;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    init();
}

void MainWindow::init()
{
    m_bRunning = true;
    m_nTaoed = 0;
    //memset(m_task, 0, sizeof(TTaskAttribute) * MAX_TASK_COUNT);
    for(int i = 0; i < MAX_TASK_COUNT; ++i)
    {
        m_task[i].nPVed = 0;
        m_task[i].nRefIndex = 0;
    }
    m_nCurTask = 0;

    connect(ui->webView, SIGNAL(linkClicked(QUrl)), this, SLOT(slotClickLink(QUrl)));
    ui->webView->page()->setLinkDelegationPolicy(QWebPage::DelegateAllLinks);
    connect(ui->webView, SIGNAL(loadFinished(bool)), this, SLOT(slotLoadFinished(bool)));
    connect(this, SIGNAL(sigLoadFinished()), this, SLOT(WaitForLoadFinished()));
    connect(this, SIGNAL(sigNextTask()), this, SLOT(StartTask()));

    //m_pTimer = new QTimer();
    //connect(m_pTimer, SIGNAL(timeout()), this, SLOT(slotTimeOut()));
    // m_pTimer->start(TASKTIMEOUT); // 单触发定时器

}

MainWindow::~MainWindow()
{
    //m_pTimer->stop();
    //delete m_pTimer;
    delete ui;
}

void MainWindow::StartTask()
{
    GetTaskData();
    ExecTask(m_nCurTask);
    m_nCurTask++;
    if(m_nCurTask >= m_nTaskCount)
    {
        m_nCurTask = 0;
    }
}

void MainWindow::ExecTask(int i)
{
    if(! isTimeIn(i))
    {
        return;
    }
    //第一次start
    //随机IP / PV比例
    if(m_task[i].nIP_PV_Ratio == 0)
    {
        m_task[i].nIP_PV_Ratio = GetRandom(1, MAX_IPPV_RADIO);
    }
    if(m_task[i].strSourceAddrs.size() == 0)
    {
        ui->webView->load(m_task[i].strNetAddr);
    }
    else
    {
        LoadUrlbyRef(m_task[i].strNetAddr, m_task[i].strSourceAddrs.at(m_task[i].nRefIndex));
        if(m_task[i].nRefIndex < (m_task[i].strSourceAddrs.size() - 1))
        {
            m_task[i].nRefIndex++;
        }
        else
        {
            m_task[i].nRefIndex = 0;
        }
    }
    //第一次end
}

void MainWindow::WaitForLoadFinished()
{
    if(CheckPv(m_nCurTask))
    {
        ClickSubLink(m_nCurTask);
    }
    else
    {
        emit sigNextTask();
    }
}

bool MainWindow::CheckPv(int i)
{
    m_task[i].nPVed++;
    if(m_task[i].nPVed >= m_task[i].nIP_PV_Ratio)
    {
        ChangeProxy();
        m_task[i].nPVed = 0;
        return false;
    }
    return true;
}

void MainWindow::ClickSubLink(int i)
{
    QStringList list;
    QWebFrame* frame = ui->webView->page()->currentFrame();
    if(frame != NULL)
    {
        //得到当前页面的所有链接
        QWebElementCollection document = frame->findAllElements("a");
        qDebug()<< "count = "<< document.count();
        for(int n = 0; n < document.count(); ++n)
        {
            if(document.at(n).attribute("href").contains("http://"))
                    //||
                   // (document.at(n).attribute("href").contains("https://")))
            {
                //qDebug()<<"href = "<<document.at(n).attribute("href");
                list.push_back(document.at(n).attribute("href"));
            }
        }
        //随机点击子链
        int max = 0;
LoadRandomLink:
        max++;
        QString str = list.at(GetRandom(0, list.size() - 1));
        //qDebug()<<m_task[i].strMainKey;
        if(str.contains(m_task[i].strMainKey))
        {
            qDebug() << "str ===" << str;
            LoadUrlbyRef(QUrl(str), m_CurUrl);
            return;
        }
        else
        {
            if(max >= MAX_RANDOM_LINK)
            {
                emit sigNextTask();
            }
            goto LoadRandomLink;
        }
    }
}

bool MainWindow::isTimeIn(int i)
{
    QTime time;
    time = QTime::currentTime();
    if((time.hour() >= m_task[i].nStarTiming) &&
            (time.hour() <= m_task[i].nEndTiming))
    {
        return true;
    }
    return false;
}

void MainWindow::ChangeProxy()
{
    if(g_nUsedIp < TOTALIP_PER_DAY)
    {
        //从数据库获取代理 随机使用
        //QNetworkProxy::setApplicationProxy(QNetworkProxy(QNetworkProxy::HttpProxy,"218.108.170.170",82));
        g_nUsedIp++;
    }
    else
    {
        QNetworkProxy::setApplicationProxy(QNetworkProxy::NoProxy);
    }
}

void MainWindow::GetTaskData()
{
    QSettings settings(".\\wkdata", QSettings::IniFormat);
    m_nTaskCount = settings.value("TaskCount/Value").toInt();
    m_nTaoed = settings.value("Taoed/Value").toInt();
    for(int i = 1; i <= m_nTaskCount; ++i)
    {
        QString str = "Task";
        str += QString::number(i, 10);
        QString str1 = str;
        str1 += "/TaskType";
        str1 = settings.value(str1).toString();

        if(str1 == "Flow")
        {
            GetFlowData(str, settings, i - 1);
        }
        else if(str1 == "KeyWord")
        {
        }
        else if(str1 == "Alexa")
        {
        }
        else if(str1 == "QSpacing")
        {
        }
    }
    for(int n = 0; n < m_nTaskCount; ++n)
    {
        m_task[n].strMainKey = GetMainKeyByUrl(m_task[n].strNetAddr);
    }
}

void MainWindow::LoadUrlbyRef(QUrl des, QUrl ref)
{
    QNetworkRequest request;

    // connect(pReply, SIGNAL(finished()), this, SLOT(replyFinished()));
    //theW->load(request);
    // 设定url
    request.setUrl(des);

    // 设定请求头
    // request.setRawHeader("Host", "www.guaiguainv.com");
    //request.setRawHeader("User-Agent", "mozilla/4.0 (compatible; msie 7.0; windows nt 5.2; .net clr 1.1.4322; .net clr 2.0.50727; .net clr 3.0.04506.648; .net clr 3.5.21022; .net4.0c; .net4.0e; .net clr 3.0.4506.2152; .net clr 3.5.30729)");
    // request.setRawHeader("Accept-Encoding", "gzip, deflate");
    //request.setRawHeader("Accept-Language", "fr-fr");
    request.setRawHeader("Referer", ref.toEncoded());
    //request.setRawHeader("Accept", "*/*");

    ui->webView->load(request);

    m_CurUrl = ui->webView->url();

}

void MainWindow::slotClickLink(QUrl url)
{
    QNetworkRequest request;
    request.setRawHeader("Referer", m_CurUrl.toEncoded());
    request.setUrl(url);

    ui->webView->load(request);

    m_CurUrl = ui->webView->url();


}

void MainWindow::slotLoadFinished(bool ok)
{
    if(ok)
    {
        ++m_nTaoed;
        QSettings settings(".\\wkdata", QSettings::IniFormat);
        settings.beginGroup("Taoed");
        settings.setValue("Value", m_nTaoed);
        settings.endGroup();

        m_CurUrl = ui->webView->url();
        //sleep(TAO_SLEEP_STEP);
        //ui->webView->close();
        emit sigLoadFinished();
    }
    else
    {
        emit sigNextTask();
    }
}

void MainWindow::GetFlowData(QString & str,
                             QSettings & settings, int nIndex)
{
    //qDebug()<< "rrtr";
    QString str1 = str;
    str1 += "/EndTime";
    m_task[nIndex].nEndTiming = settings.value(str1).toInt();
    str1 = str;
    str1 += "/StartTime";
    m_task[nIndex].nStarTiming = settings.value(str1).toInt();
    str1 = str;
    str1 += "/IpPVRadio";
    m_task[nIndex].nIP_PV_Ratio = settings.value(str1).toInt();
    str1 = str;
    str1 += "/IpPerHour";
    m_task[nIndex].nMaxIpPerHour = settings.value(str1).toInt();
    str1 = str;
    str1 += "/SearchEngine";
    m_task[nIndex].nSearchEngineSel = settings.value(str1).toInt();
    str1 = str;
    str1 += "/stat";
    m_task[nIndex].nStat = settings.value(str1).toInt();
    str1 = str;
    str1 += "/isTiming";
    m_task[nIndex].isTiming = settings.value(str1).toInt();
    //qDebug()<<m_task[nIndex].isTiming;
    str1 = str;
    str1 += "/isMaxIp";
    m_task[nIndex].isMaxIp = settings.value(str1).toInt();
    str1 = str;
    str1 += "/NetAddr";
    m_task[nIndex].strNetAddr = settings.value(str1).toString();
    m_task[nIndex].strType = "Flow";
    str1 = str;
    str1 += "Source";
    settings.beginGroup(str1);
    m_task[nIndex].strSourceAddrs = settings.allKeys();
    settings.endGroup();
    for(int i = 0; i < m_task[nIndex].strSourceAddrs.size(); ++i)
    {
        //qDebug()<<m_task[nIndex].strSourceAddrs.at(i).toLocal8Bit().constData();
    }
    str1 = str;
    str1 += "Click";
    settings.beginGroup(str1);
    m_task[nIndex].strClickAddrs = settings.allKeys();
    settings.endGroup();
    for(int i = 0; i < m_task[nIndex].strClickAddrs.size(); ++i)
    {
        //qDebug()<<m_task[nIndex].strClickAddrs.at(i).toLocal8Bit().constData();
    }
}

int MainWindow::GetTaskCount()
{
    return m_nTaskCount;
}

TTaskAttribute & MainWindow::GetTaskAttr(int nIndex)
{
    return m_task[nIndex];
}
