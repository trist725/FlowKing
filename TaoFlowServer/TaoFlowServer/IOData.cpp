
#include "IOData.h"
#include <stdio.h>

void ParsePacket(OnlineClient_T* pClient)
{
	printf("start parse\n");
}

void ReadData(OnlineClient_T* pClient)
{
	while (true) 
	{
		int ret = recv(pClient->nFd, pClient->rBuf + pClient->nReadIndex,
						BUFFERSIZE - pClient->nReadIndex, MSG_NOSIGNAL);
	printf("recv = %d\n", ret);
		if (ret < 0)
		{
			//无数据可读
			if (errno == EAGAIN)
			{
				break;
			}
			else
			{
				close(pClient->nFd); // Error occured
				break;
			}			
		}
		else if (ret > 0) 
		{
			pClient->nReadIndex += ret;
			if (pClient->nReadIndex >= PACKSIZE_FLAG)
			{
				memcpy(&pClient->nPackSize, &pClient->rBuf, PACKSIZE_FLAG);
				if (pClient->nReadIndex >= pClient->nPackSize)
				{
					ParsePacket(pClient);
					break;
				}
			}
		} 
		else if (ret == 0) 
		{
			close(pClient->nFd);
			break;
		}
	}
}

