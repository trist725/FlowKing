
#include "mainwindow.h"
#include <QApplication>
#include <stdio.h>
#include <pthread.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "TaoFlowServer.h"
#include "ThreadPool.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>

int main(int argc, char* argv[])
{
    //QApplication a(argc, argv);
    //MainWindow mw;
    //mw.show();

    //return a.exec();

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL"); // 使用mysql数据库驱动
            db.setHostName("localhost");
            db.setDatabaseName("jeecms_2012_sp1"); // 我们之前建立的数据库
            db.setUserName("trist725"); // 我们创建的 yunfan 用户名
            db.setPassword("chen30"); // yunfan 用户的密码

            bool ok = db.open(); // 尝试连接数据库

            if(ok)
            {
            int a;
            a++;
            }\
            qDebug()<<db.lastError();
	//创建主程序模块
	CTcpServer server;

	//初始化线程池
	server.InitBreathThread();

	//运行主程序
	server.Run();

	return 0;
}
