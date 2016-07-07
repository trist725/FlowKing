
#include "IOData.h"
#include <stdio.h>

void ParsePacket(OnlineClient_T* &pClient)
{
    //qDebug()<<"start parse\n";
    if (pClient->nReadIndex >= PACKSIZE_FLAG)
    {
        memcpy(&pClient->nPackSize, &pClient->rBuf, PACKSIZE_FLAG);
        if (!(pClient->nReadIndex >= pClient->nPackSize))
        {
            return;
        }
    }

    PackHead_T head;
    memcpy(&head, pClient->rBuf+PACKSIZE_FLAG, PACKHEAD_SIZE);
    int nFlagSize = 0;
    std::string str;
    PackHead_T head2;
    int ret = 0;
    int nSended = 0;
    int index = 0;
    switch (head.ePType)
    {
    default:
        break;
    case LoginReq:
        LogCli_T body;
        LogSer_T body2;
        memcpy(&body, pClient->rBuf+PACKSIZE_FLAG+PACKHEAD_SIZE, sizeof(LogCli_T));
        if(body.nSecretCode == SECRET_CODE)
        {
            body2.bOk = true;
            strncpy(pClient->MachCode, body.MachCode, MACHINECODE_SIZE);
        }
        else
        {
            body2.bOk = false;
            close(pClient->nFd);
        }
        nFlagSize = PACKHEAD_SIZE + sizeof(LogSer_T);
        str.resize(nFlagSize + PACKSIZE_FLAG);
        memcpy((void *)str.data(), &nFlagSize, PACKSIZE_FLAG);
        head2.eCType = Server;
        head2.ePType = LoginRes;
        head2.nBodySize = sizeof(LogSer_T);
        memcpy((void *)(str.data() + PACKSIZE_FLAG), &head2, sizeof(head2));
        memcpy((void *)(str.data() + PACKHEAD_SIZE + PACKSIZE_FLAG), &body2, sizeof(body2));
        ret = send(pClient->nFd, (void *)str.data(), nFlagSize + PACKSIZE_FLAG, MSG_NOSIGNAL);
        qDebug()<<"send = "<<ret;
        if(ret > 0)
        {
            nSended += ret;
        }
ReSend:
        if(nSended == (nFlagSize + PACKSIZE_FLAG))
        {
            pClient->nReadIndex -= (pClient->nPackSize+PACKSIZE_FLAG);
            memcpy(pClient->rBuf, pClient->rBuf+nFlagSize+PACKSIZE_FLAG, pClient->nReadIndex);
            break;
        }
        else if((ret < (nFlagSize + PACKSIZE_FLAG)) && (ret > 0))
        {
            ret = send(pClient->nFd, (void *)(str.data() + nSended),
                       nFlagSize + PACKSIZE_FLAG - ret, MSG_NOSIGNAL);
            qDebug()<<"send = "<<ret;
            if(ret > 0)
            {
                nSended += ret;
            }
            index++;
            if(index >= 10)
            {
                break;
            }
            goto ReSend;
        }
        break;
    case BreathReq:
        head2.eCType = Server;
        head2.ePType = BreathRes;
        head2.nBodySize = 0;
        nFlagSize = PACKHEAD_SIZE;
        str.resize(PACKHEAD_SIZE + PACKSIZE_FLAG);
        memcpy((void *)str.data(), &nFlagSize, PACKSIZE_FLAG);
        memcpy((void *)(str.data() + PACKSIZE_FLAG), &head2, sizeof(head2));
        ret = send(pClient->nFd, (void *)str.data(), nFlagSize + PACKSIZE_FLAG, MSG_NOSIGNAL);
        qDebug()<<"send = "<<ret;
        pClient->nReadIndex -= (nFlagSize+PACKSIZE_FLAG);
        memcpy(pClient->rBuf, pClient->rBuf+nFlagSize+PACKSIZE_FLAG, pClient->nReadIndex);
        break;
    case TaskReq:
        break;
    case LogOutReq:
        close(pClient->nFd);
        break;
    }
    if(pClient->nReadIndex > 0)
    {
        //recursion
        ParsePacket(pClient);
    }
    //memset
}

void ReadData(OnlineClient_T* &pClient)
{
    qDebug()<<("read data\n");
    while (true)
    {
        int ret = recv(pClient->nFd, pClient->rBuf + pClient->nReadIndex,
                       BUFFERSIZE - pClient->nReadIndex, MSG_NOSIGNAL);
        qDebug()<<"recv  = "<<ret;
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
            ParsePacket(pClient);
            break;
        }
        else if (ret == 0)
        {
            close(pClient->nFd);
            break;
        }
    }
}

