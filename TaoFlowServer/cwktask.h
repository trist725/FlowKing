#ifndef CWKTASK_H
#define CWKTASK_H

#include <QObject>
#include <QString>
#include <QStringList>
#include <QNetworkRequest>
#include <QTime>
#include <QTimer>
#include <QSettings>
#include <QWebElementCollection>
#include <QWebFrame>
#include <QWebElement>
#include <QDebug>
#include <QUrl>
#include <QNetworkProxy>
#include <QWebView>
#include "MyFunc.h"
#include <QSqlQuery>
#include <QEventLoop>
#include <QNetworkCookieJar>
#include <QNetworkReply>
//#include <QMutex>
//#include <QMutexLocker>

#define MAX_IP_PV_RADIO 7
const int Province_Count = 35;

struct TTaskAttribute
{
    int nPVed;
    int nRefIndex;
    QString strMainKey;

    int nTaskId;
    int nUserId;
    float fPriceTotal;
    int nFlowMode;
    int nPVstay;
    int nUAmode;
    int nWhiteTblFlag;
    int nAreasMode;
    int nMulEntryMode;

    //有效期
    QString strValueDate;
    //年
    int ydate;
    //月
    int mdate;
    //日
    int ddate;

    //¶¨Ê±Á÷Á¿
    bool isTiming;
    //Ã¿Ð¡Ê±×î´óIP
    bool isMaxIp;
    //IP / PV ±ÈÀý
    int nIP_PV_Ratio;

    int nMaxIpPerHour;

    int nStarTiming;
    int nEndTiming;

    int nTaskIndex;

    //ÈÎÎñ×´Ì¬
    int nStat;

    QString strType;

    int nTaoType;
    int nTypeSel;

    //Ä¿±êÍøÖ·
    QString strNetAddr;

    //À´Ô´ÍøÖ·ÁÐ±í
    QStringList strSourceAddrs;
    int nSourceMode;
    //µã»÷ÍøÖ·ÁÐ±í
    QStringList strClickAddrs;
    int nClickMode;
    //¹Ø¼ü´Ê
    QString strKeyWord;
    int nSearchEngineSel;
    //QQºÅ
    QString strQNumber;
};

struct TimeTao
{
    int nTaoed;
    int nNeed;
};

/*struct cusRef
{
    int percent;
    QString ref;
    QString type;
}*/

class CWkTask : public QObject
{
    Q_OBJECT
public:
    explicit CWkTask();
    ~CWkTask();
    
    void reView();
    void initView();
    void freeView();

    TTaskAttribute & GetTaskAttr();
    void initTaoNeed();
    bool isRunFinished();
    int GetTaskId();

    void pvStay();
    bool changeAgent();
    bool PvIpSet();

    bool Getidel();
    void Setidle(bool idle);
    void updateTaoed();
    void dowork();
    void MultyEntry();
    void loadUrl(QNetworkRequest &rq, QUrl &ref);

    QUrl GetRandomRef();
    QUrl GetCustomRef();
    QUrl GetBatchRef();

    void initSubLink();
    QString GetRandomSubLink();
    void ClickSubLink();

    void GetWhiteClickList();

    void SetProxyIp(QString & hostIp, quint16 & port);

    void ResetCookies();
    void SetST(int st);

    bool IsIpValid(QString & ip);

protected:


public slots:
    void loadbyRefferer(QUrl url, bool isFirstTime);

    void slotLoadFinished(bool ok);
    void slotp(int p);

    void slotLoadFirst();
    void slotLoadNext();

    void slotLoadStart();
    void slotLoadTimeout();

signals:
    void sigLoadFirst();
    void workFinished();
    void sigDoWork();
    void sigLoadNext();
    //void sigloadStarted();

private:
    TTaskAttribute tattr_;
    QWebView  *view_;

    //当前页面
    QUrl cp_;

    int pvperip_;

    //加载百分比
    int lpt_;

    //数组下标0-23表示0-23点
    TimeTao tt_[24];
    int Totaltao_;

    QStringList sublinks_;

    //is running finished
    bool rf_;

    bool idle_;

    QTime ctime_;

    QNetworkAccessManager *mainnm_;
    //cookies
    QNetworkCookieJar cksj_;
    QList<QNetworkCookie> ncs_;
    //代理
    QNetworkProxy proxy_;
    QString proxyip_;
    quint16 proxyport_;

    //来源地区
    QString srcRegion_[Province_Count];

    //自定义来源
    QStringList sources_;
    //点击白名单
    QStringList cwl_;



    //view's load timer
    QTimer *timer_;
    //stopsoon's timer
    QTimer *stimer_;

    //QMutex ml_;

    QNetworkRequest rq;

    //QEventLoop eventLoop_;
    QUrl ref;


    //执行同任务线程系数
    int st_;

    bool stopflow_;
};

#endif // CWKTASK_H
