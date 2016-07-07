#ifndef DEF_H_
#define DEF_H_

#include "ClientInfo.h"
#include <errno.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <string.h>

#define  LOCALHOST_IP_ADDRESS "127.0.0.1"

enum EQueTaskType
{
	ReadTask = 0,
	WriteTask = 1,
};

typedef struct QueueInfo
{
	OnlineClient_T *pClient;
	EQueTaskType eQueTaskType;
}Que_t;




#endif
