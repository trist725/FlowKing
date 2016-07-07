
// TaoFlowDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "TaoFlowDlg.h"
#include "afxdialogex.h"
#include "TaskAttribute.h"
#include "def.h"
#include "DlgTaoAlexaSetting.h"
#include "DlgTaoQSpaceSettings.h"
#include "DlgSoftSettings.h"
#include "PacketInfo.h"

#include "windows.h"
#include "tlhelp32.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define CONFVALSIZE 150
#define BUFSIZE 8192
#define RECONNECT_SERVER 10*1000
#define READ_TIME_STEP 1000
#define TIMEOUT_COUNT 100
#define WAITFORMAIN_TIME 3000
#define BREATH_STEP 30

static const CString strVerSion("Ver 1.8.15 内测版");
std::vector<TTaskAttribute> tasks;
//全局快捷键ID
int g_nHotKeyId;

//默认全局热键alt+f6
WORD g_wVirtualKeyCode = VK_F6;
WORD g_wModifiers = HOTKEYF_ALT;
//开机启动
BOOL g_BStartWithWindows = FALSE;
//掉线超时计数器
int g_nTimeout = TIMEOUT_COUNT;

// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

// CTaoFlowDlg 对话框

CTaoFlowDlg::CTaoFlowDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CTaoFlowDlg::IDD, pParent)
	, m_nHour(0)
	, m_nMin(0)
	, m_nSecond(0)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTaoFlowDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);

	DDX_Control(pDX, IDC_SYSLINK_Register, m_linkRegister);
	DDX_Control(pDX, IDC_LIST_TaskList, m_ListTask);
	DDX_Control(pDX, IDC_STATIC_TaoVersionVar, m_strTaoVersion);
	DDX_Control(pDX, IDC_STATIC_OnlineTime, m_StcOnlineTime);
	DDX_Control(pDX, IDC_STATIC_DynamicInfo, m_stcDycInfo);
	DDX_Control(pDX, IDC_STATIC_ExInfo, m_stcExInfo);
	DDX_Control(pDX, IDC_STATIC_Taoed, m_stcTaoed);
}

BEGIN_MESSAGE_MAP(CTaoFlowDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()

	ON_MESSAGE(WM_HOTKEY,OnHotKey)
	ON_STN_CLICKED(IDC_STATIC_ShowPic, &CTaoFlowDlg::OnStnClickedStaticShowpic)
	ON_NOTIFY(NM_CLICK, IDC_SYSLINK_Settings, &CTaoFlowDlg::OnNMClickSyslinkSettings)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDC_BUTTON_TaoFlowSettings, &CTaoFlowDlg::OnBnClickedButtonTaoflowsettings)
	ON_NOTIFY(NM_CLICK, IDC_SYSLINK_About, &CTaoFlowDlg::OnNMClickSyslinkAbout)
	ON_NOTIFY(NM_CLICK, IDC_SYSLINK_Register, &CTaoFlowDlg::OnNMClickSyslinkRegister)
//	ON_BN_CLICKED(IDC_BUTTON_Login, &CTaoFlowDlg::OnBnClickedButtonLogin)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST_TaskList, &CTaoFlowDlg::OnDblclkListTasklist)
	ON_WM_CREATE()
ON_WM_CREATE()
ON_BN_CLICKED(IDC_BUTTON_TaoKeyWordSetting, &CTaoFlowDlg::OnBnClickedButtonTaokeywordsetting)
ON_WM_TIMER()
ON_BN_CLICKED(IDC_BUTTON_TaoAlexaSetting, &CTaoFlowDlg::OnBnClickedButtonTaoalexasetting)
ON_BN_CLICKED(IDC_BUTTON_TaoQQSpaceSetting, &CTaoFlowDlg::OnBnClickedButtonTaoqqspacesetting)
ON_BN_CLICKED(IDC_BUTTON_HideToBG, &CTaoFlowDlg::OnBnClickedButtonHidetobg)
ON_NOTIFY(NM_CLICK, IDC_SYSLINK_FAQ, &CTaoFlowDlg::OnNMClickSyslinkFaq)
ON_WM_CLOSE()
END_MESSAGE_MAP()


// CTaoFlowDlg 消息处理程序

BOOL CTaoFlowDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码
	m_ListTask.SetExtendedStyle(LVS_EX_GRIDLINES | LVS_EX_FULLROWSELECT | LVS_NOSORTHEADER);
	m_ListTask.InsertColumn(0, _T("任务类型"), LVCFMT_CENTER, 80, 0);
	m_ListTask.InsertColumn(1, _T("目标网址"), LVCFMT_CENTER, 465, 1);
	m_ListTask.InsertColumn(2, _T("状态"), LVCFMT_CENTER, 60, 2);
	m_stcDycInfo.SetWindowTextW(_T("正在连接流量王服务器"));
	m_strTaoVersion.SetWindowTextW(strVerSion);
	m_stcExInfo.SetWindowTextW(NULL);
	
	LoadConfigureFile();
	LoadTaskDataFile();
	
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

//读配置文件
void CTaoFlowDlg::LoadConfigureFile()
{
	CString strPath = _T(".//conf.ini");
	//读取快捷键
	g_wVirtualKeyCode = GetPrivateProfileInt(_T("快捷键"), _T("VirtualKeyCode"), 0, strPath);
	g_wModifiers = GetPrivateProfileInt(_T("快捷键"), _T("Modifiers"), 0, strPath);
	//设置快捷键
	g_nHotKeyId = GlobalAddAtom(_T("MyHotKey")) - 0xC000; 
	//默认设为Alt+F6
	if ((0 == g_wVirtualKeyCode) || (0 == g_wModifiers))
	{
		//shift和alt相反
		g_wModifiers = MOD_SHIFT;
		g_wVirtualKeyCode = VK_F6;
	}
	RegisterHotKey(AfxGetMainWnd()->m_hWnd, g_nHotKeyId, g_wModifiers, g_wVirtualKeyCode);
	//读取开机启动
	g_BStartWithWindows = GetPrivateProfileInt(_T("开机启动"), _T("Value"), 0, strPath);
}

//读任务文件
void CTaoFlowDlg::LoadTaskDataFile()
{
	CString strPath = _T(".\\wkdata");
	GetTaoed();
	int nTaskCount = GetPrivateProfileInt(_T("TaskCount"), _T("Value"), 0, strPath);
	 for(int i = 1; i <= nTaskCount; ++i)
	 {
		 CString strSection, strKey = _T("TaskType"), strValue;
		 strSection.Format(_T("%s%d"),  _T("Task"), i);
		 GetPrivateProfileString(strSection, strKey, _T(""),
			 strValue.GetBuffer(CONFVALSIZE), CONFVALSIZE, strPath);
		  
		 if(strValue == _T("Flow"))
		 {
			 GetFlowDataF(strSection, strKey, strPath, strValue);
		 }
		 else if(strValue == _T("KeyWord"))
		 {}
		 else if(strValue == _T("Alexa"))
		 {}
		 else if(strValue == _T("QSpacing"))
		 {}
	 }
}
void CTaoFlowDlg::GetFlowDataF(CString & strSection, CString & strKey,
							   CString & strPath, CString & strValue)
{
	TTaskAttribute task;
	strKey = _T("isTiming");
	task.bFlowTiming = GetPrivateProfileInt(strSection, strKey, 0, strPath)? true:false;
	strKey = _T("isMaxIp");
	task.bMaxIpPerHour = GetPrivateProfileInt(strSection, strKey, 0, strPath)? true:false;
	strKey = _T("NetAddr");
	strValue.ReleaseBuffer();
	GetPrivateProfileString(strSection, strKey, _T(""),
		strValue.GetBuffer(CONFVALSIZE), CONFVALSIZE, strPath);
	task.strNetAddr = strValue;
	strKey = _T("StartTime");
	task.nStarTiming = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	strKey = _T("EndTime");
	task.nEndTiming = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	strKey = _T("TaskIndex");
	task.nTaskIndex = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	strKey = _T("IpPerHour");
	task.nMaxIpPerHour = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	strKey = _T("IpPvRadio");
	task.nIP_PV_Ratio = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	strKey = _T("stat");
	task.eStat = GetPrivateProfileInt(strSection, strKey, 0, strPath)? Running:Stop;
	strKey = _T("IpPvRadio");
	task.nIP_PV_Ratio = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	CString strSource = strSection + _T("Source");
	strValue.ReleaseBuffer();
	DWORD ret = GetPrivateProfileSection(strSource, strValue.GetBuffer(BUFSIZE), BUFSIZE, strPath);

	DWORD nPos = 0;
	DWORD nIndex = 0;
	while (nPos < (ret - 2))
	{
		nPos = strValue.Find(_T("=\0"), nIndex);
		CString str = strValue.Mid(nIndex, nPos-nIndex);
		if (str.IsEmpty())
		{
			break;
		}
		Tlist list;
		list.strType = _T("自定义来源");
		list.strTypeAddr = str;
		task.vecSourceAddr.push_back(list);
		nIndex = nPos + 2;
	}

	CString strClick = strSection + _T("Click");
	strValue.ReleaseBuffer();
	ret = GetPrivateProfileSection(strClick, strValue.GetBuffer(BUFSIZE), BUFSIZE, strPath);

	nPos = 0;
	nIndex = 0;
	while (nPos < (ret - 2))
	{
		nPos = strValue.Find(_T("=\0"), nIndex);
		CString str = strValue.Mid(nIndex, nPos-nIndex);
		if (str.IsEmpty())
		{
			break;
		}
		Tlist list;
		list.strType = _T("自定义点击");
		list.strTypeAddr = str;
		task.vecClickAddr.push_back(list);
		nIndex = nPos + 2;
	}
	strKey = _T("TaoType");
	task.nTaoType = GetPrivateProfileInt(strSection, strKey, 0, strPath);
	int nCount = m_ListTask.GetItemCount();
	switch (task.nTaoType)
	{
	case 0:
		m_ListTask.InsertItem(nCount, _T("淘流量"));
		break;
	case 1:
		m_ListTask.InsertItem(nCount, _T("淘人气"));
		break;
	case 2:
		m_ListTask.InsertItem(nCount, _T("淘广告"));
		break;
	}
	m_ListTask.SetItemText(nCount, 1, task.strNetAddr);
	switch (task.eStat)
	{
	case Running:
		m_ListTask.SetItemText(nCount, 2, _T("运行中"));
		break;
	case Stop:
		m_ListTask.SetItemText(nCount, 2, _T("已停止"));
		break;
	case Finished:
		m_ListTask.SetItemText(nCount, 2, _T("已完成"));
		break;
	}
	tasks.push_back(task);
}

void CTaoFlowDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{

	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CTaoFlowDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CTaoFlowDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

//banner
void CTaoFlowDlg::OnStnClickedStaticShowpic()
{
	// TODO: 在此添加控件通知处理程序代码

}

//设置
void CTaoFlowDlg::OnNMClickSyslinkSettings(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgSoftSettings dlg;
	int nRet = dlg.DoModal();
	if (IDOK == nRet)
	{

	}
	*pResult = 0;
}

//注册成为高级会员
void CTaoFlowDlg::OnNMClickSyslinkRegister(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 在此添加控件通知处理程序代码
	PNMLINK pNMLink = (PNMLINK)pNMHDR;
	::ShellExecute(m_hWnd, _T("open"), pNMLink->item.szUrl, NULL, NULL, SW_SHOWNORMAL);
	*pResult = 0;
}

//淘流量
void CTaoFlowDlg::OnBnClickedButtonTaoflowsettings()
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgTaoFlowSettings dlgTaoFlowSet;
	dlgTaoFlowSet.SetCaption(_T("淘流量设置"));
	INT_PTR dlgRet = dlgTaoFlowSet.DoModal();
	
	if (IDOK == dlgRet)
	{
		std::vector<TTaskAttribute>::reverse_iterator rit = tasks.rbegin();
		int nCount = m_ListTask.GetItemCount();
		CString strTaskType;
		switch (rit->nTaoType)
		{
		case 0:
			strTaskType = _T("淘流量");
			break;
		case 1:
			strTaskType = _T("淘人气");
			break;
		case 2:
			strTaskType = _T("淘广告");
			break;
		}
		m_ListTask.InsertItem(nCount, strTaskType);
		m_ListTask.SetItemText(nCount, 1, rit->strNetAddr);
		m_ListTask.SetItemText(nCount, 2, _T("运行中"));

		SetFlowDataF(tasks.size());
	}
}

void CTaoFlowDlg::CloseProgram(CString strProgram)
{
	HANDLE handle; //定义CreateToolhelp32Snapshot系统快照句柄 
	HANDLE handle1; //定义要结束进程句柄 
	handle = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);//获得系统快照句柄 
	PROCESSENTRY32 *info; //定义PROCESSENTRY32结构字指 
	//PROCESSENTRY32 结构的 dwSize 成员设置成 sizeof(PROCESSENTRY32) 

	info = new PROCESSENTRY32; 
	info->dwSize = sizeof(PROCESSENTRY32); 
	//调用一次 Process32First 函数，从快照中获取进程列表 
	Process32First(handle, info); 
	//重复调用 Process32Next，直到函数返回 FALSE 为止 
	while(Process32Next(handle, info) != FALSE) 
	{   
		CString strTmp = info->szExeFile;     //指向进程名字   
		//strcmp字符串比较函数同要结束相同   
		//if(strcmp(c, info->szExeFile) == 0 )   
		if (strProgram.CompareNoCase(info->szExeFile) == 0 )   
		{   
			//PROCESS_TERMINATE表示为结束操作打开,FALSE=可继承,info->th32ProcessID=进程ID    
			handle1 = OpenProcess(PROCESS_TERMINATE, FALSE, info->th32ProcessID); 
			//结束进程    
			TerminateProcess(handle1, 0);    
		}   
	}
	delete info;

	CloseHandle(handle);
}

void CTaoFlowDlg::SetFlowDataF(int nIndex)
{
	TTaskAttribute rit = tasks.at(nIndex - 1);
	//关了改写配置文件再开
	CloseProgram(_T("wk.exe"));
	CString strPathName = _T(".\\wkdata");
	CString str, str1;
	str.Format(_T("%d"), tasks.size());
	//任务数
	WritePrivateProfileString(_T("TaskCount"), _T("Value"), str, strPathName);
	//流量定时、目标网址、IP / PV比例等
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	WritePrivateProfileString(str, _T("NetAddr"), rit.strNetAddr, strPathName);
	WritePrivateProfileString(str, _T("TaskType"), _T("Flow"), strPathName);
	str1.Format(_T("%d"), nIndex - 1);
	WritePrivateProfileString(str, _T("TaskIndex"), str1, strPathName);
	str1.Format(_T("%d"), rit.nTaoType);
	WritePrivateProfileString(str, _T("TaoType"), str1, strPathName);
	str1.Format(_T("%d"), rit.nStarTiming);
	WritePrivateProfileString(str, _T("StartTime"), str1, strPathName);
	str1.Format(_T("%d"), rit.nEndTiming);
	WritePrivateProfileString(str, _T("EndTime"), str1, strPathName);
	str1.Format(_T("%d"), rit.bFlowTiming);
	WritePrivateProfileString(str, _T("isTiming"), str1, strPathName);
	str1.Format(_T("%d"), rit.bMaxIpPerHour);
	WritePrivateProfileString(str, _T("isMaxIp"), str1, strPathName);
	str1.Format(_T("%d"), rit.nMaxIpPerHour);
	WritePrivateProfileString(str, _T("IpPerHour"), str1, strPathName);
	str1.Format(_T("%d"), rit.nIP_PV_Ratio);
	WritePrivateProfileString(str, _T("IpPvRadio"), str1, strPathName);
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	str1.Format(_T("%d"), rit.eStat);
	WritePrivateProfileString(str, _T("stat"), str1, strPathName);
	//来源网址
	std::vector<Tlist>::iterator sit = rit.vecSourceAddr.begin();
	str += _T("Source");
	for (; sit != rit.vecSourceAddr.end(); sit++)
	{
		WritePrivateProfileString(str, sit->strTypeAddr, _T(""), strPathName);
	}

	//点击网址
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	str += _T("Click");
	std::vector<Tlist>::iterator cit = rit.vecClickAddr.begin();
	for (; cit != rit.vecClickAddr.end(); cit++)
	{
		WritePrivateProfileString(str, cit->strTypeAddr, _T("ClickAddr"), strPathName);
	}

	WinExec(".\\wk.exe",SW_HIDE);
}
void CTaoFlowDlg::SetKeyWordDataF(int nIndex)
{
	TTaskAttribute rit = tasks.at(nIndex - 1);
	//关了改写配置文件再开
	CloseProgram(_T("wk.exe"));
	CString strPathName = _T(".\\wkdata");
	CString str, str1;
	str.Format(_T("%d"), tasks.size());
	//任务数
	WritePrivateProfileString(_T("TaskCount"), _T("Value"), str, strPathName);
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	WritePrivateProfileString(str, _T("TaskType"), _T("KeyWord"), strPathName);
	//目标网址
	WritePrivateProfileString(str, _T("NetAddr"), rit.strNetAddr, strPathName);
	//关键词
	WritePrivateProfileString(str, _T("KeyWord"), rit.strKeyWord, strPathName);
	str1.Format(_T("%d"), rit.nSearchEngineSel);
	WritePrivateProfileString(str, _T("SearchEngine"), str1, strPathName);
	str1.Format(_T("%d"), rit.eStat);
	WritePrivateProfileString(str, _T("stat"), str1, strPathName);
	WinExec(".\\wk.exe",SW_HIDE);
}
void CTaoFlowDlg::SetAlexaDataF(int nIndex)
{
	TTaskAttribute rit = tasks.at(nIndex - 1);
	//关了改写配置文件再开
	CloseProgram(_T("wk.exe"));
	CString strPathName = _T(".\\wkdata");
	CString str, str1;
	str.Format(_T("%d"), tasks.size());
	//任务数
	WritePrivateProfileString(_T("TaskCount"), _T("Value"), str, strPathName);
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	WritePrivateProfileString(str, _T("TaskType"), _T("Alexa"), strPathName);
	//目标网址
	WritePrivateProfileString(str, _T("NetAddr"), rit.strNetAddr, strPathName);
	str1.Format(_T("%d"), rit.eStat);
	WritePrivateProfileString(str, _T("stat"), str1, strPathName);
	WinExec(".\\wk.exe",SW_HIDE);
}
void CTaoFlowDlg::SetQSpaceDataF(int nIndex)
{
	TTaskAttribute rit = tasks.at(nIndex - 1);
	//关了改写配置文件再开
	CloseProgram(_T("wk.exe"));
	CString strPathName = _T(".\\wkdata");
	CString str1;
	str1.Format(_T("%d"), tasks.size());
	//任务数
	WritePrivateProfileString(_T("TaskCount"), _T("Value"), str1, strPathName);
	str1.Format(_T("%s%d"), _T("Task"), nIndex);
	WritePrivateProfileString(str1, _T("TaskType"), _T("QSpacing"), strPathName);
	//目标网址
	CString str = _T("http://user.qzone.qq.com/");
	str += rit.strQNumber;
	WritePrivateProfileString(str1, _T("NetAddr"), str, strPathName);
	str1.Format(_T("%d"), rit.eStat);
	str.Format(_T("%s%d"), _T("Task"), nIndex);
	WritePrivateProfileString(str, _T("stat"), str1, strPathName);
	WinExec(".\\wk.exe",SW_HIDE);
}

//淘关键字
void CTaoFlowDlg::OnBnClickedButtonTaokeywordsetting()
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgOptimizeKeyWord dlg;
	int nRet = dlg.DoModal();
	if (IDOK == nRet)
	{
		std::vector<TTaskAttribute>::reverse_iterator rit = tasks.rbegin();
		int nCount = m_ListTask.GetItemCount();
		m_ListTask.InsertItem(nCount, _T("淘关键字"));
		m_ListTask.SetItemText(nCount, 1, rit->strNetAddr);
		m_ListTask.SetItemText(nCount, 2, _T("运行中"));

		SetKeyWordDataF(tasks.size());
	}
}

//淘Alexa
void CTaoFlowDlg::OnBnClickedButtonTaoalexasetting()
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgTaoAlexaSetting dlg;
	int nRet = dlg.DoModal();
	if (IDOK == nRet)
	{
		std::vector<TTaskAttribute>::reverse_iterator rit = tasks.rbegin();
		int nCount = m_ListTask.GetItemCount();
		m_ListTask.InsertItem(nCount, _T("淘Alexa"));
		m_ListTask.SetItemText(nCount, 1, rit->strNetAddr);
		m_ListTask.SetItemText(nCount, 2, _T("运行中"));

		SetAlexaDataF(tasks.size());
	}
}

//淘QQ空间
void CTaoFlowDlg::OnBnClickedButtonTaoqqspacesetting()
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgTaoQSpaceSettings dlg;
	int nRet = dlg.DoModal();
	if (IDOK == nRet)
	{
		std::vector<TTaskAttribute>::reverse_iterator rit = tasks.rbegin();
		CString str = _T("http://user.qzone.qq.com/");
		str += rit->strQNumber;
		int nCount = m_ListTask.GetItemCount();
		m_ListTask.InsertItem(nCount, _T("淘QQ空间"));
		m_ListTask.SetItemText(nCount, 1, str);
		m_ListTask.SetItemText(nCount, 2, _T("运行中"));

		SetQSpaceDataF(tasks.size());
	}
}

//关于
void CTaoFlowDlg::OnNMClickSyslinkAbout(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 在此添加控件通知处理程序代码
	CDlgAboutBox about;
	about.DoModal();

	*pResult = 0;
}



//任务列表
void CTaoFlowDlg::OnDblclkListTasklist(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: 在此添加控件通知处理程序代码
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	if (pNMListView->iItem < 0)
	{
		return;
	}
	TTaskAttribute &task = tasks.at(pNMListView->iItem);
	int nRet;
	CDlgTaoFlowSettings dlg(task);
	CDlgOptimizeKeyWord dlg1(task);
	CDlgTaoAlexaSetting dlg2(task);
	CDlgTaoQSpaceSettings dlg3(task);
	switch (task.eType)
	{
	default:
		nRet = dlg.DoModal();
		break;
	case Alexa:
		nRet = dlg2.DoModal();
		break;
	case KeyWord:
		nRet = dlg1.DoModal();
		break;
	case QSpace:
		nRet = dlg3.DoModal();
		break;
	}
	if (IDOK == nRet)
	{
		CString str, str1;
		CString strPathName = _T(".\\wkdata");
		int nTaskCount = 0;
		unsigned int i = 0;
		switch (task.eAction)
		{
		default:
			break;
		case StartTask:
			m_ListTask.SetItemText(pNMListView->iItem, 2, _T("运行中"));
			CloseProgram(_T("wk.exe"));
			str1.Format(_T("%d"), 1);
			str.Format(_T("%s%d"), _T("Task"), pNMListView->iItem + 1);
			WritePrivateProfileString(str, _T("stat"), str1, strPathName);
			WinExec(".\\wk.exe",SW_HIDE);
			break;
		case StopTask:
			m_ListTask.SetItemText(pNMListView->iItem, 2, _T("已停止"));
			CloseProgram(_T("wk.exe"));
			str1.Format(_T("%d"), 0);
			str.Format(_T("%s%d"), _T("Task"), pNMListView->iItem + 1);
			WritePrivateProfileString(str, _T("stat"), str1, strPathName);
			WinExec(".\\wk.exe",SW_HIDE);
			break;
		case DelTask:
			tasks.erase(tasks.begin() + pNMListView->iItem);			
			CloseProgram(_T("wk.exe"));
			nTaskCount = GetPrivateProfileInt(_T("TaskCount"), _T("Value"), 0, strPathName);
			str.Format(_T("%d"), nTaskCount - 1);
			WritePrivateProfileString(_T("TaskCount"), _T("Value"), str, strPathName);
			DelAllTaskDataF();
			for (size_t i = 1; i <= tasks.size(); ++i)
			{
				SetFlowDataF(i);
			}
			m_ListTask.DeleteItem(pNMListView->iItem);
			WinExec(".\\wk.exe",SW_HIDE);
			break;
		case ModTask:
			CloseProgram(_T("wk.exe"));
			switch (task.eType)
			{
			default:
				m_ListTask.SetItemText(pNMListView->iItem, 1, task.strNetAddr);
				str.Format(_T("%s%d"), _T("Task"), pNMListView->iItem + 1);
				str += _T("Source");
				WritePrivateProfileString(str, NULL, NULL, strPathName);
				str.Format(_T("%s%d"), _T("Task"), pNMListView->iItem + 1);
				str += _T("Click");
				WritePrivateProfileString(str, NULL, NULL, strPathName);
				SetFlowDataF(pNMListView->iItem + 1);
				break;
			case KeyWord:
				m_ListTask.SetItemText(pNMListView->iItem, 1, task.strNetAddr);
				SetKeyWordDataF(pNMListView->iItem + 1);
				break;
			case Alexa:
				m_ListTask.SetItemText(pNMListView->iItem, 1, task.strNetAddr);
				SetAlexaDataF(pNMListView->iItem + 1);
				break;
			case QSpace:
				CString str = _T("user.qzone.qq.com/");
				str += task.strQNumber;
				m_ListTask.SetItemText(pNMListView->iItem, 1, str);
				SetQSpaceDataF(pNMListView->iItem + 1);
				break;
			}		
			WinExec(".\\wk.exe",SW_HIDE);
			break;
		}
	}
	
	*pResult = 0;
}

void CTaoFlowDlg::DelAllTaskDataF()
{
	CString str;
	for (int i = 1; i < MAXTASKCOUNT; ++i)
	{		
		str.Format(_T("%s%d"), _T("Task"), i);
		WritePrivateProfileString(str, NULL, NULL, _T(".\\wkdata"));
	}
}

//隐藏至后台挂机
void CTaoFlowDlg::OnBnClickedButtonHidetobg()
{
	// TODO: 在此添加控件通知处理程序代码
	ShowWindow(SW_HIDE);
}

HBRUSH CTaoFlowDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	/*
	CFont * cFont=new CFont; 
	cFont->CreateFont(16,0,0,0,FW_SEMIBOLD,FALSE,FALSE,0,  ANSI_CHARSET,OUT_DEFAULT_PRECIS,
		CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY, DEFAULT_PITCH&FF_SWISS,_T("Arial"));
	*/
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_DynamicInfo) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_TaoVersionVar) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_TaoVesionTxt))
	{ 
		pDC->SetTextColor(RGB(255, 0, 0));
	}
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_HotKeyNotice) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_Taoed))
	{
		pDC->SetTextColor(RGB(0, 0, 255));
	}

	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}

void CTaoFlowDlg::GetTaoed()
{
	//读Taoed
	CString strPath = _T(".\\wkdata");
	int nTaoed = GetPrivateProfileInt(_T("Taoed"), _T("Value"), 0, strPath);
	CString str;
	str.Format(_T("%d"), nTaoed);
	m_stcTaoed.SetWindowTextW(str);
}

void CTaoFlowDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值

	CDialogEx::OnTimer(nIDEvent);
	
	CString strOnlineTime;
	CString strHour, strMin, strSecond;
	m_nSecond += 1;
	if (60 == m_nSecond)
	{
		m_nMin += 1;
		m_nSecond = 0;
		//每分钟读一次Taoed
		GetTaoed();
	}
	if (60 == m_nMin)
	{
		m_nHour += 1;
		m_nMin = 0;
	}
	strHour.Format(_T("%d%s"), m_nHour, _T("小时"));
	strMin.Format(_T("%d%s"), m_nMin, _T("分钟"));
	strSecond.Format(_T("%d%s"), m_nSecond, _T("秒"));
	strOnlineTime += strHour;
	strOnlineTime += strMin;
	strOnlineTime += strSecond;
	if (m_nHour >= MAXINT)
	{
		//-。-
		m_StcOnlineTime.SetWindowTextW(_T("Very Very Long Time"));
	} 
	else
	{
		m_StcOnlineTime.SetWindowTextW(strOnlineTime);
	}

}

UINT ThreadFunc(LPVOID ThreadArg)
{  
	int nBreathStep = 0;
	unsigned long ul = 1;
	Sleep(WAITFORMAIN_TIME);
	CTaoFlowDlg *pDlg = (CTaoFlowDlg *)ThreadArg;
	pDlg->m_Sock.InitSock();
ConnectToServer:
	int sock = pDlg->m_Sock.ConnectTo(DEFAULT_SERVER_PORT, "192.168.1.2");
	if (sock <= 0)
	{
		pDlg->m_stcDycInfo.SetWindowTextW(_T("连接服务器失败，正在重试"));
		Sleep(RECONNECT_SERVER);
		goto ConnectToServer;
	}
	ioctlsocket(sock, FIONBIO, (unsigned long *)&ul);
LoginToServer:
	//发登录包
	PackHead_T head;
	head.ePType = LoginReq;
	head.eCType = FlowClient;
	LogCli_T body;
	CString strSerial = GetSerialNum();
	CString2Char(strSerial, body.MachCode);
	body.nSecretCode = SECRET_CODE;
	head.nBodySize = sizeof(LogCli_T);
	int flag = sizeof(PackHead_T) + sizeof(LogCli_T);
	std::string str;
	str.resize(flag + PACKSIZE_FLAG);
	memcpy((void *)(str.data()), &flag, PACKSIZE_FLAG);
	memcpy((void *)(str.data() + PACKSIZE_FLAG), &head, sizeof(head));
	memcpy((void *)(str.data() + PACKSIZE_FLAG + sizeof(head)), &body, sizeof(body));
	int n = send(sock, str.data(), flag + PACKSIZE_FLAG, 0);
	if (n >= flag + PACKSIZE_FLAG)
	{
		while (1)
		{
			str.resize(BUFFERSIZE);
			n = recv(sock, (char *)str.data(), BUFFERSIZE, 0);
			if (n >= PACKHEAD_SIZE)
			{
				PackHead_T head;
				memcpy(&head, (void *)(str.data() + PACKSIZE_FLAG), PACKHEAD_SIZE);
				if (head.ePType == BreathRes)
				{
					//重置掉线超时计数器
					g_nTimeout = TIMEOUT_COUNT;
				}
				else
				{
					int flagsize;
					memcpy(&flagsize, (void *)str.data(), PACKSIZE_FLAG);
					if (n >= flagsize)
					{
						switch (head.ePType)
						{
						case LoginRes:
							LogSer_T body;
							memcpy(&body, (void *)(str.data() + PACKSIZE_FLAG + PACKHEAD_SIZE), sizeof(LogSer_T));
							if (body.bOk)
							{
								pDlg->m_stcDycInfo.SetWindowTextW(_T("已成功连接至流量王服务器"));
							}
							else
							{
								Sleep(RECONNECT_SERVER);
								goto LoginToServer;
							}
							break;
						case TaskRes:
							break;
						}
					}
				}
			}
			//发心跳包
			nBreathStep++;
			if (nBreathStep > 30)
			{
				PackHead_T head;
				head.ePType = BreathReq;
				head.eCType = FlowClient;
				head.nBodySize = 0;
				int flag = PACKHEAD_SIZE;
				str.resize(flag + PACKSIZE_FLAG);
				memcpy((void *)(str.data()), &flag, PACKSIZE_FLAG);
				memcpy((void *)(str.data() + PACKSIZE_FLAG), &head, sizeof(head));
				n = send(sock, str.data(), flag + PACKSIZE_FLAG, 0);
				nBreathStep = 0;
			}
			Sleep(READ_TIME_STEP);
			//超时计数器
			g_nTimeout--;
			if (g_nTimeout <= 0)
			{
				pDlg->m_stcDycInfo.SetWindowTextW(_T("从服务器的连接已断开，请检查网络"));
				closesocket(sock);
				goto ConnectToServer;
			}
		}
	}
	else
	{
		closesocket(sock);
		goto LoginToServer;
	}
	closesocket(sock);
	WSACleanup();
	return 0;
}

int CTaoFlowDlg::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialogEx::OnCreate(lpCreateStruct) == -1)
		return -1;

	// TODO:  在此添加您专用的创建代码

	//socket thread
	m_ThreadHandle = AfxBeginThread(ThreadFunc,
		this,
		THREAD_PRIORITY_NORMAL,
		0,
		0,
		NULL);
	SetTimer(1, 990, NULL);
	WinExec(".\\wk.exe",SW_HIDE);
	return 0;
}

HRESULT CTaoFlowDlg::OnHotKey(WPARAM wParam,LPARAM lParam)
{
	if (this->IsWindowVisible())
	{
		this->ShowWindow(SW_HIDE);
	}
	else
	{
		this->ShowWindow(SW_SHOW);
	}
	
	return TRUE;
}

//FAQ
void CTaoFlowDlg::OnNMClickSyslinkFaq(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 在此添加控件通知处理程序代码
	*pResult = 0;
}


void CTaoFlowDlg::OnClose()
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
	if(MessageBox(_T("确定要退出吗？"), _T("退出流量王"), MB_YESNO) == IDYES)
	{
		//写配置文件
		CString strPathName = _T(".\\conf.ini");
		CString strVirtualKeyCode;
		CString strModifiers;
		strVirtualKeyCode.Format(_T("%hu"), g_wVirtualKeyCode);
		strModifiers.Format(_T("%hu"), g_wModifiers);
		WritePrivateProfileString(_T("快捷键"), _T("VirtualKeyCode"), strVirtualKeyCode, strPathName);
		WritePrivateProfileString(_T("快捷键"), _T("Modifiers"), strModifiers, strPathName);
		CString str;
		str.Format(_T("%d"), g_BStartWithWindows);
		WritePrivateProfileString(_T("开机启动"), _T("Value"), str, strPathName);
		
		CloseProgram(_T("wk.exe"));
		CDialogEx::OnClose();
	}
}


