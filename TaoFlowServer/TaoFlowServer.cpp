/**
* TaoFlowServer.cpp
* 2013.5 by Tristone
*/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <unistd.h>
#include <fcntl.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/epoll.h>
#include <queue>
#include "TaoFlowServer.h"
#include "def.h"

#define BACKLOG 16
#define MAXCONNECTION 8192
#define EPOLL_WAIT_TIMEOUT 10
#define DEFAULT_LISTEN_PORT 8765
#define TRY_LOCK_TIMEOUT 100

std::queue<Que_t> g_TaskQue;
pthread_mutex_t g_QueMutex = PTHREAD_MUTEX_INITIALIZER;

std::list<OnlineClient_T> CTcpServer::m_OnlineClients;

IBase::~IBase()
{
}

CTcpServer::CTcpServer() :
    m_bRunning(false),
    m_fdEpoll(-1)
{
    m_OnlineClients.clear();
    m_Thpool.InitThreadPool();
    InitBreathThread();
}

CTcpServer::~CTcpServer()
{
    Close();
}

bool CTcpServer::Close()
{
    m_bRunning = false;
    return true;
}

bool CTcpServer::Run()
{
    m_fdEpoll = epoll_create(MAXCONNECTION);
    if(m_fdEpoll == -1)
    {
        perror("epoll_create");
        return false;
    }

    int nListenFd = Init_Listen(DEFAULT_LISTEN_PORT);

    epoll_event evListen;
    evListen.data.fd = nListenFd;
    evListen.events = EPOLLIN | EPOLLET;
    if(epoll_ctl(m_fdEpoll, EPOLL_CTL_ADD, nListenFd, &evListen) == -1)
    {
        perror("epoll_ctl");
        close(m_fdEpoll);
        return false;
    }

    //epoll loop
    socklen_t len;
    struct sockaddr_in addr;
    epoll_event events[MAXCONNECTION];
    m_bRunning = true;
    while (m_bRunning)
    {
        int nfds = epoll_wait(m_fdEpoll, events, MAXCONNECTION, EPOLL_WAIT_TIMEOUT);
        if (nfds != -1)
        {
            for(int i = 0; i < nfds; i++)
            {
                //accept
                if (events[i].data.fd == nListenFd)
                {
                    int nConnFd = accept(nListenFd, (struct sockaddr *)&addr, &len);
                    if (0 > nConnFd)
                    {
                        perror("accept");
                        continue;
                    }
                    printf("accetp = %d\n", nConnFd);
                    SetNonBlocking(nConnFd);
                    epoll_event evConnect;
                    //添加新epoll_event
                    evConnect.data.fd = nConnFd;
                    evConnect.events = EPOLLIN | EPOLLET;
                    epoll_ctl(m_fdEpoll, EPOLL_CTL_ADD, nConnFd, &evConnect);
                    //分配空间并初始化客户端信息加入在线列表
                    OnlineClient_T client;
                    client.bStat = true;
                    client.nFd = nConnFd;
                    client.nReadIndex = 0;
                    //					client.nWriteIndex = 0;
                    pthread_mutex_init(&client.mtx, NULL);
                    client.nTimeout = CLIENTTIMEOUT;
                    m_OnlineClients.push_back(client);
                }
                //readable
                else if (events[i].events & EPOLLIN)
                {
                    printf("readable\n");
                    PushTaskToQue(events[i].data.fd);
                }
            }
        }
        else if(errno == EINTR)
        {
            //error_log("[epoll_wait fail][error=EINTR]");
        }
        else
        {
            //error_log("[epoll_wait fail][error=%d,fd=%d]", errno, m_fdEpoll);
            Close();
        }
    }
    return true;
}

int CTcpServer::Init_Listen(int port)
{
    int sock;
    struct sockaddr_in addr;
    int nOpt;

    bzero(&addr, sizeof(addr));
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);

    //socket
    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (0 > sock)
    {
        perror("socket");
        return(-1);
    }

    //设置SO_REUSEADDR选项(服务器快速重起)
    nOpt = 0x1;
    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &nOpt, sizeof(nOpt));

    //bind
    if (0 > bind(sock, (struct sockaddr *)&addr, sizeof(addr)))
    {
        perror("bind");
        close(sock);
        return(-2);
    }

    //listen
    if (0 > listen(sock, BACKLOG))
    {
        perror("listen");
        close(sock);
        return(-3);
    }

    return sock;
}

bool CTcpServer::SetNonBlocking(int sock)
{
    int opts;
    opts = fcntl(sock, F_GETFL);
    if (opts < 0)
    {
        perror("fcntl F_GETFL");
        return false;
    }
    //这个跟recv/send的最后一个参数MSG_DONTWAIT的效果一样
    opts = opts | O_NONBLOCK;
    if (fcntl(sock, F_SETFL, opts) < 0)
    {
        perror("fcntl F_SETFL");
        return false;
    }
    return true;
}

OnlineClient_T* CTcpServer::GetClientInfo(int nFd)
{
    std::list<OnlineClient_T>::iterator it = m_OnlineClients.begin();
    for (; it != m_OnlineClients.end(); ++it)
    {
        if (it->nFd == nFd)
        {
            return (OnlineClient_T *)&(*it);
        }
    }
    return NULL;
}

void CTcpServer::PushTaskToQue(int nFd)
{
    Que_t que;

    que.pClient = GetClientInfo(nFd);
    if (NULL == que.pClient)
    {
        return;
    }
    que.eQueTaskType = ReadTask;
    int nTryTime = 0;
    while (0 == pthread_mutex_trylock(&g_QueMutex))
    {
        usleep(TRY_LOCK_TIMEOUT);
        nTryTime++;
        if (nTryTime > 10)
        {
            printf("lock que fail\n");
            return;
        }
    }
    g_TaskQue.push(que);
    m_Thpool.DispatchThread();
    pthread_mutex_unlock(&g_QueMutex);
}

void* CTcpServer::BreathThread(void* arg)
{
    while (1)
    {
        std::list<OnlineClient_T>::iterator it = m_OnlineClients.begin();
        for (; it != m_OnlineClients.end(); )
        {
            if (0 < it->nTimeout)
            {
                it->nTimeout -= 1;
                ++it;
            }
            else
            {
                close(it->nFd);
                it = m_OnlineClients.erase(it);
            }
        }
        sleep(CLIENTTIMEOUT);
    }
    return NULL;
}

void CTcpServer::InitBreathThread()
{
    //设置线程分离属性
    pthread_attr_t  thread_attr;
    pthread_attr_init(&thread_attr);
    pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);

    pthread_t pid;
    pthread_create(&pid, &thread_attr, BreathThread, NULL);
}

