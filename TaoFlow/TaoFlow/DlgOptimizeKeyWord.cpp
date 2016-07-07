// DlgOptimizeKeyWord.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgOptimizeKeyWord.h"
#include "afxdialogex.h"
#include "def.h"

extern std::vector<TTaskAttribute> tasks;

// CDlgOptimizeKeyWord 对话框

IMPLEMENT_DYNAMIC(CDlgOptimizeKeyWord, CDialogEx)

CDlgOptimizeKeyWord::CDlgOptimizeKeyWord(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgOptimizeKeyWord::IDD, pParent)
	, m_bEntryType(FALSE)
	, m_bTaskIsRunning(TRUE)
	, m_StrNetAddr(_T(""))
	, m_strKeyWord(_T(""))
	, m_nSearchEngineSel(0)
{

}

CDlgOptimizeKeyWord::CDlgOptimizeKeyWord(TTaskAttribute &task, CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgOptimizeKeyWord::IDD, pParent)
{
	m_bEntryType = true;
	if (task.eStat == Running)
	{
		m_bTaskIsRunning = true;
	}
	else
	{
		m_bTaskIsRunning = false;
	}
	m_StrNetAddr = task.strNetAddr;
	m_strKeyWord = task.strKeyWord;
	m_nSearchEngineSel = task.nSearchEngineSel;
	m_nTaskIndex = task.nTaskIndex;
}

CDlgOptimizeKeyWord::~CDlgOptimizeKeyWord()
{
}

void CDlgOptimizeKeyWord::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT1, m_EditNetAddr);
	DDX_Control(pDX, IDC_EDIT2, m_EditKeyWord);
	DDX_Control(pDX, IDC_COMBO1, m_ComboSearchEngine);
	DDX_Control(pDX, IDOK, m_BtnAddStartTask);
	DDX_Control(pDX, IDC_BUTTON_DelTask, m_BtnDelTask);
	DDX_Control(pDX, IDC_BUTTON_ModTask, m_BtnModTask);
	DDX_Control(pDX, IDC_BUTTON_StopTask, m_BtnStopTask);
	DDX_Control(pDX, IDC_BUTTON_StartTask, m_BtnStartTask);
	DDX_Text(pDX, IDC_EDIT1, m_StrNetAddr);
	DDX_Text(pDX, IDC_EDIT2, m_strKeyWord);
}


BEGIN_MESSAGE_MAP(CDlgOptimizeKeyWord, CDialogEx)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDOK, &CDlgOptimizeKeyWord::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BUTTON_StartTask, &CDlgOptimizeKeyWord::OnBnClickedButtonStarttask)
	ON_BN_CLICKED(IDC_BUTTON_StopTask, &CDlgOptimizeKeyWord::OnBnClickedButtonStoptask)
	ON_BN_CLICKED(IDC_BUTTON_DelTask, &CDlgOptimizeKeyWord::OnBnClickedButtonDeltask)
	ON_BN_CLICKED(IDC_BUTTON_ModTask, &CDlgOptimizeKeyWord::OnBnClickedButtonModtask)
END_MESSAGE_MAP()


// CDlgOptimizeKeyWord 消息处理程序


BOOL CDlgOptimizeKeyWord::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_EditKeyWord.SetCueBanner(_T("在此输入关键词"));
	m_EditNetAddr.SetCueBanner(_T("在此处输入您的网站"));
	m_ComboSearchEngine.AddString(_T("百度搜索"));
	m_ComboSearchEngine.AddString(_T("谷歌搜索"));
	m_ComboSearchEngine.AddString(_T("搜狗搜索"));
	m_ComboSearchEngine.AddString(_T("有道搜索"));
	m_ComboSearchEngine.AddString(_T("bing搜索"));
	m_ComboSearchEngine.AddString(_T("360搜索"));
	m_ComboSearchEngine.SetCurSel(0);

	if (m_bEntryType)
	{
		m_BtnAddStartTask.EnableWindow(FALSE);
	}
	else
	{
		m_BtnDelTask.EnableWindow(FALSE);
		m_BtnStopTask.EnableWindow(FALSE);
		m_BtnStartTask.EnableWindow(FALSE);
		m_BtnModTask.EnableWindow(FALSE);
	}
	if (m_bTaskIsRunning)
	{
		m_BtnStartTask.EnableWindow(FALSE);
	}
	else
	{
		m_BtnStopTask.EnableWindow(FALSE);
	}
	m_ComboSearchEngine.SetCurSel(m_nSearchEngineSel);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}


HBRUSH CDlgOptimizeKeyWord::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_KeyZhu) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_KeyZhu1) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_KeyZhu2) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_KeyZhu3))
	{
		pDC->SetTextColor(RGB(144,144,144));
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}


void CDlgOptimizeKeyWord::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	if (tasks.size() < MAXTASKCOUNT)
	{
		UpdateData(TRUE);
		if (m_strKeyWord.IsEmpty() || m_StrNetAddr.IsEmpty())
		{
			AfxMessageBox(_T("网址或关键词不能为空"));
			return;
		}
		TTaskAttribute task;
		task.nTaskIndex = tasks.size();
		task.strNetAddr =  m_StrNetAddr;
		task.strKeyWord = m_strKeyWord;
		task.eStat = Running;
		task.eType = KeyWord;
		task.nSearchEngineSel = m_ComboSearchEngine.GetCurSel();

		tasks.push_back(task);
	}
	else
	{
		AfxMessageBox(_T("由于您不是会员，所以我们只能很遗憾地告诉您：\n您的可建任务数已达上限，请先删除任务或者注册会员尊享更多功能。"));
		OnCancel();
		return;
	}
	CDialogEx::OnOK();
}


void CDlgOptimizeKeyWord::OnBnClickedButtonStarttask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = true;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Running;
	task.eAction = StartTask;
	OnOK();
}


void CDlgOptimizeKeyWord::OnBnClickedButtonStoptask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = false;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Stop;
	task.eAction = StopTask;
	OnOK();
}


void CDlgOptimizeKeyWord::OnBnClickedButtonDeltask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = DelTask;
	OnOK();
}


void CDlgOptimizeKeyWord::OnBnClickedButtonModtask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = ModTask;
	UpdateData(TRUE);
	task.eType = KeyWord;
	task.strNetAddr = m_StrNetAddr;
	task.strKeyWord = m_strKeyWord;

	OnOK();
}
