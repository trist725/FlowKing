#pragma once

#include <vector>



enum ETaskStat
{
	Running = 1,
	Stop = 0,
	Finished = -1,
};

enum ETaoFlowType
{
	Flow = 0,
	//单页广告
	AdsSingle = 1,
	//全站广告
	AdsWhole = 2,
	//博客人气
	BlogPop = -1,
	//空间人气
	SpacePop = -2,
	//论坛人气
	BbsPop = -3,
	//商品人气
	CommodityPop = -4,
	//网店人气
	OnlineShopPop = -5,

	//淘关键字
	KeyWord = 3,
	//淘Alexa
	Alexa = 4,
	//淘QQ空间
	QSpace = 5,
};

enum ETaskSetAction
{
	NoAction = 0,
	StartTask = 1,
	StopTask = 2,
	ModTask = 3,
	DelTask = 4,
};

typedef struct Typelist
{
	CString strType;
	CString strTypeAddr;
}Tlist;

struct TTaskAttribute
{
	//定时流量
	bool bFlowTiming;
	//每小时最大IP
	bool bMaxIpPerHour;
	//IP / PV 比例
	int nIP_PV_Ratio;

	int nMaxIpPerHour;

	int nStarTiming;
	int nEndTiming;

	int nTaskIndex;

	//任务状态
	ETaskStat eStat;
	//任务类型
	ETaoFlowType eType;
	int nTaoType;
	int nTypeSel;
	//任务操作
	ETaskSetAction eAction;

	//目标网址
	CString strNetAddr;

	//来源网址列表
	std::vector<Tlist> vecSourceAddr;
	//点击网址列表
	std::vector<Tlist> vecClickAddr;
	//关键词
	CString strKeyWord;
	int nSearchEngineSel;
	//QQ号
	CString strQNumber;
};









