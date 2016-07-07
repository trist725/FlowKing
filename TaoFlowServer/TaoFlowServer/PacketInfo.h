#ifndef PACKETINFO_H_
#define PACKETINFO_H_

#include "ClientInfo.h"

enum EPackType
{
    RequestClient = 0,
    RespondClient = 1,
    RequestServer = 2,
    RespondServer = 3,
};

enum EPackAct
{
	//任务
    PackTask = 0,
	//心跳
    PackBreath = 1,
	//登录
    PackLogin = 2,
	//注销
    PackLogout = 3,
};

enum EClientType
{
    Server = 0,
    //liuliang ban
    FlowClient = 1,
    //guaji ban
    HangOnClient = 2,
    //server sync data
    SyncDataServer = 3,
};

//包头
typedef struct PackHead
{
    EPackAct eAct;
    EPackType ePType;
    EClientType eCType;
	int nBodySize;
}PackHead_T;

//包体

//客户端
//登录包
typedef struct LoginClient
{
    char MachCode[MACHINECODE_SIZE];
}LogCli_T


//服务端
//登录回应包

#define PACKHEAD_SIZE sizeof(PackHead_T)

#endif
