#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QNetworkRequest>
#include <QTime>
#include <QSettings>
#include <QWebElementCollection>
#include <QWebFrame>
#include <QWebElement>
#include <QDebug>
#include <QUrl>
#include <QNetworkProxy>
#include "TaskAttr.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    int GetTaskCount();
    void GetTaskData();
    void init();
    TTaskAttribute & GetTaskAttr(int nIndex);

    void ExecTask(int i);
    void GetFlowData(QString & str,
                     QSettings & settings, int nIndex);

    void LoadUrlbyRef(QUrl des, QUrl ref);


    void ChangeProxy();

    bool CheckPv(int i);
    bool isTimeIn(int i);
   // void ClickSubLink(int i);

    void ClickSubLink(int i);

public slots:
    void slotClickLink(QUrl url);
    void slotLoadFinished(bool ok);

    void WaitForLoadFinished();
    void StartTask();

signals:
    void sigLoadFinished();
    void sigNextTask();

private:
    Ui::MainWindow *ui;
    bool m_bRunning;

    unsigned int m_nTaoed;
   // QTimer *m_pTimer;
    int m_nTaskCount;
    TTaskAttribute m_task[MAX_TASK_COUNT];
    QUrl m_CurUrl;
    int m_nCurTask;
};

#endif // MAINWINDOW_H
