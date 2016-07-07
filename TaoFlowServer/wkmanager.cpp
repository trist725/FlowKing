#include "wkmanager.h"


//ÈÎÎñ·ÖÅä¼ì²â¼ä¸ô ms
const int Dispath_Task_Step = 10 * 1000;
const int Check_Task_Step = 20 * 1000;
const int Update_Date_Time = 60 * 1000;
const int IPS_PER_THREAD = 2000;

//ÒÑ¸ºÔØ
int g_nCurWkThRuns = 0;

CWkManager::CWkManager(QObject *parent) :
    QObject(parent)
{
    m_dbt.dbName = "jeecms_2012_sp1";
    m_dbt.dbType = "QMYSQL";
    m_dbt.HostName = "localhost";
    m_dbt.UserName = "root";
    m_dbt.UserPasswd = "123456";

    dbInit(m_dbt);
    initTimer();
    initDateTime();

    slotDispatchTask();
}

CWkManager::~CWkManager()
{

}

bool CWkManager::dbInit(DbConn_T & dbt)
{
    //qDebug()<<"............"<<QSqlDatabase::drivers();
    dbt.db = QSqlDatabase::addDatabase(dbt.dbType); // Ê¹ÓÃmysqlÊý¾Ý¿âÇý¶¯
    dbt.db.setHostName(dbt.HostName);
    dbt.db.setDatabaseName(dbt.dbName); // Êý¾Ý¿âÃû
    dbt.db.setUserName(dbt.UserName); // ÓÃ»§Ãû
    dbt.db.setPassword(dbt.UserPasswd); // ÃÜÂë

    bool ok = dbt.db.open(); // ³¢ÊÔÁ¬½ÓÊý¾Ý¿â

    if(!ok)
    {
        qDebug()<<dbt.db.lastError();
    }
    return ok;
}

void CWkManager::initTimer()
{
    //connect( &ctimer_, SIGNAL(timeout()), this, SLOT(slotCheckTaskList()));
    //connect( &dtimer_, SIGNAL(timeout()), this, SLOT(slotDispatchTask()));
    connect( &dttimer_, SIGNAL(timeout()), this, SLOT(slotUpdateDateTime()));
    //ctimer_.start( Check_Task_Step );
    //dtimer_.start(Dispath_Task_Step);
    dttimer_.start(Update_Date_Time);
}

void CWkManager::WakupTasks()
{
    for(int i = 0; i < OverLoad_wkThreads; ++i)
    {
        if(! wkts_[i].Getidel())
        {
            wkts_[i].slotLoadFirst();
        }
    }
}

void CWkManager::CalUserPoints()
{
    for(int i = 0; i < OverLoad_wkThreads; ++i)
    {
        if(! wkts_[i].Getidel())
        {
            //固定模式扣点
            if(1 == wkts_[i].GetTaskAttr().nFlowMode)
            {
                QSqlQuery query;
                QString str = QString("select vippoints from u_user where id=%1").arg(wkts_[i].GetTaskAttr().nUserId);
                query.exec(str);
                query.next();
                float fpt = query.value(0).toFloat();
                fpt -= wkts_[i].GetTaskAttr().fPriceTotal;
                str = QString("update u_user set vippoints = %1 where id = %2").arg(fpt).arg(wkts_[i].GetTaskAttr().nUserId);
                query.exec(str);
            }

        }
    }

}

void CWkManager::ChangeFlowData()
{
    QSqlQuery query;
    QString str;
    int flow = 0;
    for(int i = 0; i < OverLoad_wkThreads; ++i)
    {
        if(! wkts_[i].Getidel())
        {
            str = QString("select now from flow_task where taskid=%1").arg(wkts_[i].GetTaskId());
            query.exec(str);
            query.next();
            flow = query.value(0).toInt();
            str = QString("update flow_task set last=%1, now=0 where taskid=%2").arg(flow).arg(wkts_[i].GetTaskId());
            query.exec(str);
        }
    }
}

void CWkManager::slotUpdateDateTime()
{
    dt_ = QDateTime::currentDateTime();
    if(dt_.time().hour() != time_.hour())
    {
        WakupTasks();
    }
    if(dt_.date() != date_)
    {
        //CalUserPoints();
        ChangeFlowData();
    }
    time_ = dt_.time();
    date_ = dt_.date();
}

void CWkManager::initDateTime()
{
    dt_ = QDateTime::currentDateTime();
    time_ = dt_.time();
    date_ = dt_.date();
}

void CWkManager::slotCheckTaskList()
{
    //检测停止/暂停的任务是否正在运行，若是，停止它
    QSqlQuery query;
    query.exec("select taskid from flow_task where stat <> 1 and Occupy = 1");
    //。。。。。。。。。
    for( int i = 0; i < OverLoad_wkThreads ; ++i)
    {
        if(wkts_[i].isRunFinished())
        {
            wkts_[i].Setidle(true);
            //it = wkts_.erase(it);
            g_nCurWkThRuns--;
        }
    }
}

int CWkManager::CheckIdleIndex()
{
    for(int i = 0; i < OverLoad_wkThreads; ++i)
    {
        if(wkts_[i].Getidel())
        {
            return i;
        }
    }
    return OverLoad_wkThreads;
}

int CWkManager::SetNeedTheads(int index)
{
    QSqlQuery query;
    QString str;
    if( 1 == wkts_[index].GetTaskAttr().nFlowMode)
    {
        str = QString("select ipday from batch_fixed where taskid=%1").arg(wkts_[index].GetTaskAttr().nTaskId);
    }
    else if( 2 == wkts_[index].GetTaskAttr().nFlowMode)
    {
        str = QString("select ips from batch_plan where taskid=%1").arg(wkts_[index].GetTaskAttr().nTaskId);
    }
    query.exec(str);
    query.next();
    int st = query.value(0).toInt();
    if(st < IPS_PER_THREAD)
    {
        return 1;
    }
    int mod = st % IPS_PER_THREAD;
    int ret = st / IPS_PER_THREAD;
    if(mod > 0)
    {
    //    ++ret;
    }
    return ret;
}

void CWkManager::slotDispatchTask()
{
    QSqlQuery query;

    query.exec("select * from flow_task where stat = 1 and Occupy = 0");
    while(query.next())
    {
        if(g_nCurWkThRuns >= OverLoad_wkThreads)
        {
            break;
        }

        int index = CheckIdleIndex();
        if(index == OverLoad_wkThreads)
        {
            break;
        }
        GetTaskData(query, wkts_[index]);
        int st = SetNeedTheads(index);
        wkts_[index].Setidle(false);
        wkts_[index].SetST(st);
        wkts_[index].dowork();
        int lst = st;
        for(; st > 1; --st)
        {
            int index =  CheckIdleIndex();
            GetTaskData(query, wkts_[index]);
            wkts_[index].SetST(lst);
            wkts_[index].Setidle(false);
            wkts_[index].dowork();
            g_nCurWkThRuns++;
        }
        QString str = QString("update flow_task set Occupy = %1 where occupy = 0 and taskid = %2")
                .arg(lst).arg(wkts_[index].GetTaskId());
        //query.exec(str);
        g_nCurWkThRuns++;
    }

}

void CWkManager::GetTaskData(QSqlQuery & query, CWkTask & wkt)
{
    wkt.GetTaskAttr().nTaskId = query.value(0).toInt();
    wkt.GetTaskAttr().nTaoType = query.value(1).toInt();
    wkt.GetTaskAttr().nUserId = query.value(2).toInt();
    wkt.GetTaskAttr().fPriceTotal = query.value(3).toFloat();
    wkt.GetTaskAttr().strNetAddr = query.value(5).toString();
    wkt.GetTaskAttr().nFlowMode = query.value(6).toInt();
    wkt.GetTaskAttr().nIP_PV_Ratio = query.value(8).toInt();
    wkt.GetTaskAttr().nPVstay = query.value(9).toInt();
    wkt.GetTaskAttr().nSourceMode = query.value(11).toInt();
    wkt.GetTaskAttr().nClickMode = query.value(12).toInt();
    wkt.GetTaskAttr().nUAmode = query.value(13).toInt();
    wkt.GetTaskAttr().nWhiteTblFlag = query.value(14).toInt();
    wkt.GetTaskAttr().nAreasMode = query.value(15).toInt();
    wkt.GetTaskAttr().nMulEntryMode = query.value(17).toInt();
    wkt.GetTaskAttr().strValueDate = query.value(21).toString();
}
