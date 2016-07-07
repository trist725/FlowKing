#ifndef WKMANAGER_H
#define WKMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QString>
#include <QStringList>
#include <list>
#include <QTimer>
#include <QDateTime>
#include "cwktask.h"

//×î¸ß¸ºÔØ
const int OverLoad_wkThreads = 100;

struct DbConn_T
{
    QSqlDatabase db;
    QString dbType;
    QString HostName;
    QString dbName;
    QString UserName;
    QString UserPasswd;
};

class CWkManager : public QObject
{
    Q_OBJECT
public:
    explicit CWkManager(QObject *parent = 0);
    
    virtual ~CWkManager();

    bool dbInit(DbConn_T & dbt);
    void GetTaskData(QSqlQuery & query, CWkTask & wkt);

    void initTimer();
    void initDateTime();

    int CheckIdleIndex();

    void WakupTasks();
    void CalUserPoints();
    void ChangeFlowData();
    int SetNeedTheads(int index);
signals:
    

public slots:
    void slotDispatchTask();
    void slotCheckTaskList();
    void slotUpdateDateTime();

private:
    DbConn_T m_dbt;
    QTimer  ctimer_, dtimer_, dttimer_;

    //当前时间
    QDateTime dt_;
    QDate date_;
    QTime time_;

    CWkTask wkts_[OverLoad_wkThreads];


};

#endif // WKMANAGER_H
