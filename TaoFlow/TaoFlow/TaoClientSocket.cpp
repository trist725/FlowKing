#include "stdafx.h"
#include "TaoClientSocket.h"

#include "def.h"

CTaoClientSocket::CTaoClientSocket(void)
{
}


CTaoClientSocket::~CTaoClientSocket(void)
{
}

bool CTaoClientSocket::InitSock()
{
	WSADATA  Ws;
	//Init Windows Socket
	if ( WSAStartup(MAKEWORD(2, 2), &Ws) != 0 )
	{
		AfxMessageBox(_T("WSAStartup Failed"));
		return false;
	}
	return true;
}

int CTaoClientSocket::ConnectTo(int nPort, std::string strIP)
{
	struct sockaddr_in addr;
	int sock;

	addr.sin_family = AF_INET;
	addr.sin_port = htons(nPort);
	addr.sin_addr.s_addr = inet_addr(strIP.data());
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	{
		return -1;
		//exit(0);
	}
	if (connect(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
	{
		return -2;
		//int s = WSAGetLastError();
		//exit(-1);
	}
	return sock;
}


std::string CTaoClientSocket::GetHostByName(std::string & strName)
{
	struct hostent *phst;
	
	phst = gethostbyname(strName.data());

	if (phst == NULL)
	{
		return NULL;
	}

	return inet_ntoa(*((in_addr *)phst->h_addr));
}
