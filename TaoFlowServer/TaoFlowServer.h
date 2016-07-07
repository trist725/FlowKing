/**
* TaoFlowServer.cpp
* 2013.5 by Tristone
*/

#ifndef _TCPLUGINSERV_H_
#define _TCPLUGINSERV_H_

#include <list>
#include "ThreadPool.h"

class IBase
{
public:
	virtual ~IBase();
};

class IServer : public IBase
{
public:
	virtual bool Run() = 0;
	virtual bool Close() = 0;
};

class CTcpServer : public IServer
{
public:
	CTcpServer();
	~CTcpServer();

	int Init_Listen(int port);
	bool SetNonBlocking(int sock);

	virtual bool Run();
	virtual bool Close();
	
	OnlineClient_T* GetClientInfo(int nFd);

	void PushTaskToQue(int nFd);

	void InitBreathThread();
	static void* BreathThread(void* arg);

	//virtual int ReadData(int nReadFd, std::string & strBuffer, int nBufIndex, int nBufSize);
	
	

	//bool SelectPack(int nReadFd);
	//
	//std::list<OnlineClient_T>::iterator RemoveClientInfo(int nReadFd);
	//void GetPackSize(int nReadFd, OnlineClient_T* pClient);
	//int GetPackData(int nReadFd, OnlineClient_T* pClient);
	//void CheckClientInfo(OnlineClient_T* pClient);
private:
	bool m_bRunning;
	int m_fdEpoll;

	CThreadPool m_Thpool;

	static std::list<OnlineClient_T> m_OnlineClients;
};

#endif /* _TCPLUGINSERV_H_ */
