
//#include "mainwindow.h"
#include <QApplication>
#include <stdio.h>
#include <pthread.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <QDir>
#include "TaoFlowServer.h"
#include "ThreadPool.h"
#include "wkmanager.h"

void* SocketThread(void* arg)
{
    //创建主程序socket模块
    CTcpServer server;
    server.Run();
    return NULL;
}

void CreateSocketThread()
{
    //设置线程分离属性
    pthread_attr_t  thread_attr;
    pthread_attr_init(&thread_attr);
    pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);

    pthread_t pid;
    pthread_create(&pid, &thread_attr, SocketThread, NULL);
}

int main(int argc, char* argv[])
{
    //socket
    //CreateSocketThread();

    //Qt
    QApplication a(argc, argv);
    //QApplication::addLibraryPath("./");
    //QApplication::addLibraryPath("/lib");
    //QApplication::addLibraryPath("/usr/lib");
    CWkManager wkm;
    return a.exec();
}
