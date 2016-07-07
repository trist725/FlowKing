// DlgTaoFlowSettings.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgTaoFlowSettings.h"
#include "afxdialogex.h"
#include "def.h"

extern std::vector<TTaskAttribute> tasks;

// CDlgTaoFlowSettings 对话框

IMPLEMENT_DYNAMIC(CDlgTaoFlowSettings, CDialogEx)

CDlgTaoFlowSettings::CDlgTaoFlowSettings(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgTaoFlowSettings::IDD, pParent)
	, m_strNetAddr(_T(""))
	, m_nMaxIpPerHour(100)
	, m_nStartTiming(0)
	, m_nEndTiming(23)
	, m_nTaoType(0)
	, m_bFlowTiming(FALSE)
	, m_bFlowPerHour(FALSE)
	, m_nIPPVRadio(0)
	, m_bEntryType(FALSE)
	, m_bTaskIsRunning(TRUE)
{
	
}

CDlgTaoFlowSettings::CDlgTaoFlowSettings(TTaskAttribute &task, CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgTaoFlowSettings::IDD, pParent)
	, m_strNetAddr(_T(""))
	, m_nMaxIpPerHour(100)
	, m_nStartTiming(0)
	, m_nEndTiming(23)
	, m_nTaoType(0)
	, m_bFlowTiming(FALSE)
	, m_bFlowPerHour(FALSE)
	, m_bEntryType(FALSE)
{
	if (task.bFlowTiming)
	{
		m_bFlowTiming  = TRUE;
		m_nStartTiming = task.nStarTiming;
		m_nEndTiming = task.nEndTiming;
	}
	if (task.bMaxIpPerHour)
	{
		m_bFlowPerHour = TRUE;
		m_nMaxIpPerHour = task.nMaxIpPerHour;
	}
	m_nIPPVRadio = task.nIP_PV_Ratio;
	m_nTaoType = task.nTaoType;
	m_eTaskType = task.eType;
	m_nTypeSel = task.nTypeSel;
	m_strNetAddr = task.strNetAddr;
	m_bEntryType = true;
	if (task.eStat == Running)
	{
		m_bTaskIsRunning = true;
	}
	else
	{
		m_bTaskIsRunning = false;
	}
	m_nTaskIndex = task.nTaskIndex;
	m_vecClickAddr = task.vecClickAddr;
	m_vecSourceAddr = task.vecSourceAddr;
}

CDlgTaoFlowSettings::~CDlgTaoFlowSettings()
{
}

void CDlgTaoFlowSettings::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT_NetAddr, m_EditNetAddr);
	DDX_Control(pDX, IDC_EDIT_SourceAddr, m_EditSourceAddr);
	DDX_Control(pDX, IDC_EDIT_ClickAddr, m_EditClickAddr);
	DDX_Control(pDX, IDC_EDIT3, m_EditStartTime);
	DDX_Control(pDX, IDC_EDIT4, m_EditEndTime);
	DDX_Control(pDX, IDC_SPIN1, m_spinMaxIP);
	DDX_Control(pDX, IDC_EDIT_MaxIp, m_EditMaxIp);
	DDX_Control(pDX, IDC_COMBO_IP_PV_Ratio, m_ComboIpPvRatio);
	DDX_Control(pDX, IDC_COMBO2, m_ComboSourceAddr);
	DDX_Control(pDX, IDC_COMBO3, m_ComboClickAddr);
	DDX_Control(pDX, IDC_BUTTON_StartTask, m_BtnStarTask);
	DDX_Control(pDX, IDC_BUTTON_StopTask, m_BtnStopTask);
	DDX_Control(pDX, IDC_BUTTON_DelTask, m_BtnDelTask);
	DDX_Control(pDX, IDC_BUTTON_ModTask, m_BtnModTask);
	DDX_Text(pDX, IDC_EDIT_NetAddr, m_strNetAddr);
	DDX_Text(pDX, IDC_EDIT_MaxIp, m_nMaxIpPerHour);
	DDX_Text(pDX, IDC_EDIT_StartTime, m_nStartTiming);
	DDX_Text(pDX, IDC_EDIT_EndTime, m_nEndTiming);
	DDX_Control(pDX, IDC_CHECK_SetMaxIp, m_checkMaxIpPerHour);
	DDX_Control(pDX, IDC_CHECK_FlowTiming, m_checkFlowTiming);
	DDX_Control(pDX, IDC_LIST_SourceAddr, m_listSourceAddr);
	DDX_Control(pDX, IDC_LIST_ClickAddr, m_listClickAddr);
	DDX_Control(pDX, IDC_COMBO_TaoSelection, m_ComTaoSelection);
	DDX_Control(pDX, IDC_RADIO_TaoFlow, m_RadioTaoFlow);
	DDX_Radio(pDX, IDC_RADIO_TaoFlow, m_nTaoType);
	//DDV_MinMaxInt(pDX, m_nStartTiming, 0, 23);
	//DDV_MinMaxInt(pDX, m_nEndTiming, 0, 23);
	DDX_Control(pDX, IDC_BUTTON_AddTaskStart, m_BtnAddStartTask);
	DDX_Check(pDX, IDC_CHECK_FlowTiming, m_bFlowTiming);
	DDX_Check(pDX, IDC_CHECK_SetMaxIp, m_bFlowPerHour);
	DDX_CBIndex(pDX, IDC_COMBO_IP_PV_Ratio, m_nIPPVRadio);
	//DDV_MinMaxInt(pDX, m_nMaxIpPerHour, 1, 100);
}


BEGIN_MESSAGE_MAP(CDlgTaoFlowSettings, CDialogEx)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDC_CHECK_SetMaxIp, &CDlgTaoFlowSettings::OnBnClickedCheckSetmaxip)
	ON_BN_CLICKED(IDC_CHECK_FlowTiming, &CDlgTaoFlowSettings::OnBnClickedCheckFlowtiming)
	ON_BN_CLICKED(IDC_BUTTON_AddTaskStart, &CDlgTaoFlowSettings::OnBnClickedButtonAddtaskstart)
	ON_BN_CLICKED(IDC_BUTTON_AddSourceAddr, &CDlgTaoFlowSettings::OnBnClickedButtonAddsourceaddr)
	ON_BN_CLICKED(IDC_BUTTON_AddClickAddr, &CDlgTaoFlowSettings::OnBnClickedButtonAddclickaddr)
	ON_BN_CLICKED(IDC_RADIO_TaoFlow, &CDlgTaoFlowSettings::OnBnClickedRadioTaoflow)
	ON_BN_CLICKED(IDC_RADIO_TaoPopular, &CDlgTaoFlowSettings::OnBnClickedRadioTaopopular)
	ON_BN_CLICKED(IDC_RADIO_TaoAds, &CDlgTaoFlowSettings::OnBnClickedRadioTaoads)
	ON_BN_CLICKED(IDC_BUTTON_StartTask, &CDlgTaoFlowSettings::OnBnClickedButtonStarttask)
	ON_BN_CLICKED(IDC_BUTTON_StopTask, &CDlgTaoFlowSettings::OnBnClickedButtonStoptask)
	ON_BN_CLICKED(IDC_BUTTON_DelTask, &CDlgTaoFlowSettings::OnBnClickedButtonDeltask)
	ON_BN_CLICKED(IDC_BUTTON_ModTask, &CDlgTaoFlowSettings::OnBnClickedButtonModtask)
	ON_BN_CLICKED(IDC_BUTTON_DelSourceAddr, &CDlgTaoFlowSettings::OnBnClickedButtonDelsourceaddr)
	ON_BN_CLICKED(IDC_BUTTON_DelClickAddr, &CDlgTaoFlowSettings::OnBnClickedButtonDelclickaddr)
END_MESSAGE_MAP()


// CDlgTaoFlowSettings 消息处理程序


HBRUSH CDlgTaoFlowSettings::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if (pWnd->GetDlgCtrlID() == IDC_STATIC_Comment1)
	{ 
		pDC->SetTextColor(RGB(255, 0, 0));
	}
	if (pWnd->GetDlgCtrlID() == IDC_STATIC_NetAddrSetting)
	{ 
		pDC->SetTextColor(RGB(0, 0, 255));
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}

void CDlgTaoFlowSettings::OnBnClickedCheckSetmaxip()
{
	// TODO: 在此添加控件通知处理程序代码
	if (m_checkMaxIpPerHour.GetCheck())
	{
		m_EditMaxIp.EnableWindow(TRUE);
		m_spinMaxIP.EnableWindow(TRUE);
	}
	else
	{
		m_EditMaxIp.EnableWindow(FALSE);
		m_spinMaxIP.EnableWindow(FALSE);
	}
}

void CDlgTaoFlowSettings::OnBnClickedCheckFlowtiming()
{
	// TODO: 在此添加控件通知处理程序代码
	if (m_checkFlowTiming.GetCheck())
	{
		m_EditStartTime.EnableWindow(TRUE);
		m_EditEndTime.EnableWindow(TRUE);
	}
	else
	{
		m_EditStartTime.EnableWindow(FALSE);
		m_EditEndTime.EnableWindow(FALSE);
	}
}

BOOL CDlgTaoFlowSettings::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	SetWindowText(m_StrCaption);

	//m_RadioTaoFlow.SetCheck(1);

	if (!m_strNetAddr.IsEmpty())
	{
		m_EditNetAddr.SetWindowTextW(m_strNetAddr);
	}
	m_EditNetAddr.SetCueBanner(_T("请输入您要淘的网址，如http://www.baidu.com，不要忘记输入http://前缀。"));
	m_EditClickAddr.SetCueBanner(_T("在这里输入点击网址，不要忘记http://前缀"));
	m_EditSourceAddr.SetCueBanner(_T("在这里输入来源网址，不要忘记http://前缀"));
	
	if (!m_bFlowPerHour)
	{
		m_EditMaxIp.EnableWindow(FALSE);
		m_spinMaxIP.EnableWindow(FALSE);
	}
	if (!m_bFlowTiming)
	{
		m_EditStartTime.EnableWindow(FALSE);
		m_EditEndTime.EnableWindow(FALSE);
	}

	if (m_bEntryType)
	{
		m_BtnAddStartTask.EnableWindow(FALSE);
	}
	else
	{
		m_BtnDelTask.EnableWindow(FALSE);
		m_BtnStopTask.EnableWindow(FALSE);
		m_BtnStarTask.EnableWindow(FALSE);
		m_BtnModTask.EnableWindow(FALSE);
	}
	if (m_bTaskIsRunning)
	{
		m_BtnStarTask.EnableWindow(FALSE);
	}
	else
	{
		m_BtnStopTask.EnableWindow(FALSE);
	}

	m_ComboIpPvRatio.AddString(_T("随机"));
	m_ComboIpPvRatio.AddString(_T("1 / 1"));
	m_ComboIpPvRatio.AddString(_T("1 / 2"));
	m_ComboIpPvRatio.AddString(_T("1 / 3"));
	m_ComboIpPvRatio.AddString(_T("1 / 4"));	
	m_ComboIpPvRatio.SetCurSel(m_nIPPVRadio);

	m_ComboSourceAddr.AddString(_T("自定义来源"));
	//m_ComboSourceAddr.AddString(_T("随机来源"));
	//m_ComboSourceAddr.AddString(_T("直接访问"));
	//m_ComboSourceAddr.AddString(_T("百度搜索词"));
	//m_ComboSourceAddr.AddString(_T("谷歌搜索词"));
	m_ComboSourceAddr.SetCurSel(0);

	m_ComboClickAddr.AddString(_T("自定义点击"));
	//m_ComboClickAddr.AddString(_T("不点击"));
	//m_ComboClickAddr.AddString(_T("随机点击"));
	m_ComboClickAddr.SetCurSel(0);

	CWnd * pWnd = GetDlgItem(IDC_EDIT_MaxIp);
	m_spinMaxIP.SetBuddy(pWnd);
	m_spinMaxIP.SetRange32(1, 100);
	
	m_listSourceAddr.InsertColumn(0, _T("来源类型"), LVCFMT_CENTER, 100, 0);
	m_listSourceAddr.InsertColumn(1, _T("来源网址"), LVCFMT_CENTER, 337, 0);
	m_listClickAddr.InsertColumn(0, _T("点击类型"), LVCFMT_CENTER, 100, 0);
	m_listClickAddr.InsertColumn(1, _T("点击网址"), LVCFMT_CENTER, 337, 0);
	m_listClickAddr.SetExtendedStyle(LVS_EX_GRIDLINES | LVS_EX_FULLROWSELECT | LVS_NOSORTHEADER);
	m_listSourceAddr.SetExtendedStyle(LVS_EX_GRIDLINES | LVS_EX_FULLROWSELECT | LVS_NOSORTHEADER);

	if (m_nTaoType == 1)
	{
		OnBnClickedRadioTaopopular();

	}
	else if (m_nTaoType == 2)
	{
		OnBnClickedRadioTaoads();
	}
	m_ComTaoSelection.SetCurSel(m_nTypeSel);

	int n = m_vecSourceAddr.size();
	Tlist list;
	CString str;
	for (int i = 0; i < n; i++)
	{
		list = m_vecSourceAddr.at(i);
		str = list.strType;
		m_listSourceAddr.InsertItem(i, str);
		str = list.strTypeAddr;
		m_listSourceAddr.SetItemText(i, 1, str);
	}
	n = m_vecClickAddr.size();
	for (int i = 0; i < n; i++)
	{
		list = m_vecClickAddr.at(i);
		str = list.strType;
		m_listClickAddr.InsertItem(i, str);
		str = list.strTypeAddr;
		m_listClickAddr.SetItemText(i, 1, str);
	}
	
//	m_listSourceAddr.SetItemText(nCount, 1, rit->strNetAddr);
//	m_listSourceAddr.SetItemText(nCount, 2, _T("运行中"));
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}

void CDlgTaoFlowSettings::SetCaption(LPCTSTR lpszCaption)
{
	m_StrCaption = lpszCaption;
}


void CDlgTaoFlowSettings::OnBnClickedButtonAddtaskstart()
{
	// TODO: 在此添加控件通知处理程序代码
	if (tasks.size() < MAXTASKCOUNT)
	{
		UpdateData(TRUE);
		if (m_strNetAddr.IsEmpty())
		{
			AfxMessageBox(_T("请输入网址"));
			return;
		}
		if ((m_nStartTiming > m_nEndTiming) || (m_nStartTiming > 23)
			 || (m_nEndTiming > 23))
		{
			AfxMessageBox(_T("流量定时时间必须是0-23之间的数，并且开始时间不能大于结束时间"));
			return;
		}
		TTaskAttribute tmp;
		tmp.nTaskIndex = tasks.size();
		tmp.eStat = Running;
		tmp.eAction = NoAction;
		if (m_bFlowTiming)
		{
			tmp.bFlowTiming = true;
		}
		else
		{
			tmp.bFlowTiming = false;
		}
		if (m_bFlowPerHour)
		{
			tmp.bMaxIpPerHour = true;
		}
		else
		{
			tmp.bMaxIpPerHour = false;
		}
		tmp.nEndTiming = m_nEndTiming;
		tmp.nStarTiming = m_nStartTiming;
		tmp.nIP_PV_Ratio = m_ComboIpPvRatio.GetCurSel();
		SetTaskType(tmp);
		tmp.nTaoType = m_nTaoType;
		tmp.nMaxIpPerHour = m_nMaxIpPerHour;
		tmp.strNetAddr = m_strNetAddr;
		tmp.nTypeSel = m_ComTaoSelection.GetCurSel();
		int i = m_listSourceAddr.GetItemCount();
		Tlist list;
		for (int n = 0; n < i; ++n)
		{
			list.strType = m_listSourceAddr.GetItemText(n, 0);
			list.strTypeAddr = m_listSourceAddr.GetItemText(n, 1);
			tmp.vecSourceAddr.push_back(list);
		}
		i = m_listClickAddr.GetItemCount();
		for (int n = 0; n < i; ++n)
		{
			list.strType = m_listClickAddr.GetItemText(n, 0);
			list.strTypeAddr = m_listClickAddr.GetItemText(n, 1);
			tmp.vecClickAddr.push_back(list);
		}
		tasks.push_back(tmp);
	}
	else
	{
		AfxMessageBox(_T("您的可建任务数已达上限，请先删除任务或者注册会员尊享更多功能。"));
		OnCancel();
		return;
	}
	
	OnOK();
}

void CDlgTaoFlowSettings::SetTaskType(TTaskAttribute & task)
{
	int nCurSel = m_ComTaoSelection.GetCurSel();
	switch (m_nTaoType)
	{
	case 0:
		task.eType = Flow;
		break;
	case 1:
		switch (nCurSel)
		{
		case 0:
			task.eType = BlogPop;
			break;
		case 1:
			task.eType = SpacePop;
			break;
		case 2:
			task.eType = BbsPop;
			break;
		case 3:
			task.eType = CommodityPop;
			break;
		case 4:
			task.eType = OnlineShopPop;
			break;
		}
		break;
	case 2:
		switch (nCurSel)
		{
		case 0:
			task.eType = AdsSingle;
			break;
		case 1:
			task.eType = AdsWhole;
			break;
		}
		break;
	}
}

void CDlgTaoFlowSettings::OnBnClickedButtonAddsourceaddr()
{
	// TODO: 在此添加控件通知处理程序代码
	CString str, str1;
	m_EditSourceAddr.GetWindowTextW(str);
	if (str.IsEmpty())
	{
		AfxMessageBox(_T("输入不能为空"));
		return;
	}
	m_ComboSourceAddr.GetWindowTextW(str1);
	m_listSourceAddr.InsertItem(m_listSourceAddr.GetItemCount(), str1);
	m_listSourceAddr.SetItemText(m_listSourceAddr.GetItemCount()-1, 1, str);
	m_EditSourceAddr.SetWindowTextW(NULL);
}


void CDlgTaoFlowSettings::OnBnClickedButtonAddclickaddr()
{
	// TODO: 在此添加控件通知处理程序代码
	CString str, str1;
	m_EditClickAddr.GetWindowTextW(str);
	if (str.IsEmpty())
	{
		AfxMessageBox(_T("输入不能为空"));
		return;
	}
	m_ComboSourceAddr.GetWindowTextW(str1);
	m_listClickAddr.InsertItem(m_listClickAddr.GetItemCount(), str1);
	m_listClickAddr.SetItemText(m_listClickAddr.GetItemCount()-1, 1, str);
	m_EditClickAddr.SetWindowTextW(NULL);
}


void CDlgTaoFlowSettings::OnBnClickedRadioTaoflow()
{
	// TODO: 在此添加控件通知处理程序代码

	m_ComTaoSelection.EnableWindow(FALSE);
	m_EditNetAddr.SetCueBanner(_T("请输入您要淘的网址，如http://www.baidu.com，不能省略http://前缀。"));
}


void CDlgTaoFlowSettings::OnBnClickedRadioTaopopular()
{
	// TODO: 在此添加控件通知处理程序代码
	m_ComTaoSelection.EnableWindow(TRUE);
	m_ComTaoSelection.ResetContent();
	m_ComTaoSelection.AddString(_T("论坛人气"));
	m_ComTaoSelection.AddString(_T("网店人气"));
	m_ComTaoSelection.AddString(_T("商品人气"));
	m_ComTaoSelection.AddString(_T("空间人气"));
	m_ComTaoSelection.AddString(_T("博客人气"));
	m_ComTaoSelection.SetCurSel(0);
	m_EditNetAddr.SetCueBanner(_T("在这里输入博客/网店等地址，如：http://blog.sina.com.cn"));
}


void CDlgTaoFlowSettings::OnBnClickedRadioTaoads()
{
	// TODO: 在此添加控件通知处理程序代码
	m_ComTaoSelection.EnableWindow(TRUE);
	m_ComTaoSelection.ResetContent();
	m_ComTaoSelection.AddString(_T("单页广告"));
	m_ComTaoSelection.AddString(_T("全站广告"));
	m_ComTaoSelection.SetCurSel(0);
	m_EditNetAddr.SetCueBanner(_T("在这里输入广告所在网址或广告地址"));
}

//开始任务
void CDlgTaoFlowSettings::OnBnClickedButtonStarttask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = true;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Running;
	task.eAction = StartTask;
	OnOK();
}

//停止任务
void CDlgTaoFlowSettings::OnBnClickedButtonStoptask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = false;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Stop;
	task.eAction = StopTask;
	OnOK();
}

//删除任务
void CDlgTaoFlowSettings::OnBnClickedButtonDeltask()
{
	// TODO: 在此添加控件通知处理程序代码
	//tasks.erase(tasks.begin() + m_nTaskIndex); 
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = DelTask;
	OnOK();
}

//修改任务
void CDlgTaoFlowSettings::OnBnClickedButtonModtask()
{
	// TODO: 在此添加控件通知处理程序代码
	UpdateData(TRUE);
	if (m_strNetAddr.IsEmpty())
	{
		AfxMessageBox(_T("请输入网址"));
		return;
	}
	if ((m_nStartTiming < 0) || (m_nStartTiming > 23) ||
		(m_nEndTiming < 0) || (m_nEndTiming > 23))
	{
		AfxMessageBox(_T("流量定时时间必须是0-23之间的数"));
		return;
	}
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = ModTask;
	if (m_bFlowTiming)
	{
		task.bFlowTiming = true;
	}
	else
	{
		task.bFlowTiming = false;
	}
	if (m_bFlowPerHour)
	{
		task.bMaxIpPerHour = true;
	}
	else
	{
		task.bMaxIpPerHour = false;
	}
	SetTaskType(task);
	task.nEndTiming = m_nEndTiming;
	task.nIP_PV_Ratio = m_ComboIpPvRatio.GetCurSel();
	task.nMaxIpPerHour = m_nMaxIpPerHour;
	task.nStarTiming = m_nStartTiming;
	task.nTaoType = m_nTaoType;
	task.nTypeSel = m_ComTaoSelection.GetCurSel();\
	task.strNetAddr = m_strNetAddr;
	int i = m_listSourceAddr.GetItemCount();
	task.vecClickAddr.clear();
	task.vecSourceAddr.clear();
	Tlist list;
	for (int n = 0; n < i; ++n)
	{
		list.strType = m_listSourceAddr.GetItemText(n, 0);
		list.strTypeAddr = m_listSourceAddr.GetItemText(n, 1);
		task.vecSourceAddr.push_back(list);
	}
	i = m_listClickAddr.GetItemCount();
	for (int n = 0; n < i; ++n)
	{
		list.strType = m_listClickAddr.GetItemText(n, 0);
		list.strTypeAddr = m_listClickAddr.GetItemText(n, 1);
		task.vecClickAddr.push_back(list);
	}

	OnOK();

}

void CDlgTaoFlowSettings::OnBnClickedButtonDelsourceaddr()
{
	// TODO: 在此添加控件通知处理程序代码
	m_listSourceAddr.DeleteItem(m_listSourceAddr.GetNextItem(-1, LVNI_SELECTED));
}

void CDlgTaoFlowSettings::OnBnClickedButtonDelclickaddr()
{
	// TODO: 在此添加控件通知处理程序代码
	m_listClickAddr.DeleteItem(m_listClickAddr.GetNextItem(-1, LVNI_SELECTED));
}
