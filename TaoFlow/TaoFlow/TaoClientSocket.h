#pragma once

#include <iostream>
#include "TaskAttribute.h"

#define HTTPPORT 80
#define RETRYTIME 5000

class CTaoClientSocket
{
public:
	CTaoClientSocket(void);
	~CTaoClientSocket(void);

	bool InitSock();
	std::string GetHostByName(std::string & strName);
	int ConnectTo(int nPort, std::string strIP);

	std::string SetHttpPack(std::string strName,
							std::string strReferer,
							std::string strUA);
	
};

