
#include "stdafx.h"
#include "def.h"

CString GetSerialNum()
{
	TCHAR     Volume[256];//卷标名   
	TCHAR     FileSysName[256];   
	DWORD   SerialNum;//序列号   
	DWORD   FileNameLength;   
	DWORD   FileSysFlag;   
	::GetVolumeInformation(_T("c:\\"),   
		Volume,   
		256,
		&SerialNum,   
		&FileNameLength,   
		&FileSysFlag,   
		FileSysName,   
		256);
	CString Serial;
	Serial.Format(_T("1%04x"),SerialNum ^ 0x34795814);
	return Serial;
}

/**
 * 函数名: CString2Char
 * 参数1: CString str       待转换字符串
 * 参数2: char ch[]         转换后将要储存的位置
 * 将Unicode下的CString转换为char*
 */
void CString2Char(CString str, char ch[])
{
    int i;
    char *tmpch;
    int wLen = WideCharToMultiByte(CP_ACP, 0, str, -1, NULL, 0, NULL, NULL);//得到Char的长度
    tmpch = new char[wLen + 1];                                             //分配变量的地址大小
    WideCharToMultiByte(CP_ACP, 0, str, -1, tmpch, wLen, NULL, NULL);       //将CString转换成char*
    for(i = 0; tmpch[i] != '\0'; i++) ch[i] = tmpch[i];
    ch[i] = '\0';
}

