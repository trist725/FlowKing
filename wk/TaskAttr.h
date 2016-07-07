#ifndef TASKATTR_H
#define TASKATTR_H

#endif // TASKATTR_H

#include <QString>
#include <QStringList>

#define MAX_TASK_COUNT 6

struct TTaskAttribute
{
    int nPVed;
    int nRefIndex;
    QString strMainKey;

    //定时流量
    bool isTiming;
    //每小时最大IP
    bool isMaxIp;
    //IP / PV 比例
    int nIP_PV_Ratio;

    int nTaoedInHour;
    int nMaxIpPerHour;

    int nStarTiming;
    int nEndTiming;

    int nTaskIndex;

    //任务状态
    int nStat;

    QString strType;

    int nTaoType;
    int nTypeSel;

    //目标网址
    QString strNetAddr;

    //来源网址列表
    QStringList strSourceAddrs;
    //点击网址列表
    QStringList strClickAddrs;
    //关键词
    QString strKeyWord;
    int nSearchEngineSel;
    //QQ号
    QString strQNumber;
};
