#ifndef IODATA_H_
#define IODATA_H_

#include "def.h"
#include "PacketInfo.h"
#include <QDebug>

void ParsePacket(OnlineClient_T* &pClient);
void ReadData(OnlineClient_T* &pClient);


#endif
