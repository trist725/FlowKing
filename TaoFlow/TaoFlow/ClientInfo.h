#ifndef CLIENTINFO_H_
#define CLIENTINFO_H_

#include <string>

#define MACHINECODE_SIZE 10

//服务器默认监听端口
#define DEFAULTPORT 8765

//缓冲区大小
#define BUFFERSIZE 1024*8 + PACKSIZE_FLAG

#define CLIENTTIMEOUT 10

//在线客户端结构体
typedef struct ConnectedTerminal
{
	bool bStat;	//客户端状态 0-offline;1-online
	int nFd;
	int nTimeout;
	int nReadIndex;
	int nWriteIndex;
	int nPackSize;
	char rBuf[BUFFERSIZE];
    char MachCode[MACHINECODE_SIZE];
}OnlineClient_T;

#endif

