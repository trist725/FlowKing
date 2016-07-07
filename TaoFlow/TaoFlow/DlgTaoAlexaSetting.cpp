// DlgTaoAlexaSetting.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgTaoAlexaSetting.h"
#include "afxdialogex.h"
#include "def.h"

extern std::vector<TTaskAttribute> tasks;

// CDlgTaoAlexaSetting 对话框

IMPLEMENT_DYNAMIC(CDlgTaoAlexaSetting, CDialogEx)

CDlgTaoAlexaSetting::CDlgTaoAlexaSetting(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgTaoAlexaSetting::IDD, pParent)
	, m_bEntryType(FALSE)
	, m_bTaskIsRunning(TRUE)
	, m_strNetAddr(_T(""))
{

}
CDlgTaoAlexaSetting::CDlgTaoAlexaSetting(TTaskAttribute &task, CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgTaoAlexaSetting::IDD, pParent)
	, m_bEntryType(FALSE)
	, m_bTaskIsRunning(TRUE)
{
	if (task.eStat == Running)
	{
		m_bTaskIsRunning = true;
	}
	else
	{
		m_bTaskIsRunning = false;
	}
	m_bEntryType = true;
	m_strNetAddr = task.strNetAddr;
	m_nTaskIndex = task.nTaskIndex;
}

CDlgTaoAlexaSetting::~CDlgTaoAlexaSetting()
{
}

void CDlgTaoAlexaSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT1, m_EditNetAddr);
	DDX_Control(pDX, IDOK, m_BtnAddStartTask);
	DDX_Control(pDX, IDC_BUTTON_ModTask, m_BtnModTask);
	DDX_Control(pDX, IDC_BUTTON_DelTask, m_BtnDelTask);
	DDX_Control(pDX, IDC_BUTTON_StopTask, m_BtnStopTask);
	DDX_Control(pDX, IDC_BUTTON_StartTask, m_BtnStartTask);
	DDX_Text(pDX, IDC_EDIT1, m_strNetAddr);
}


BEGIN_MESSAGE_MAP(CDlgTaoAlexaSetting, CDialogEx)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDOK, &CDlgTaoAlexaSetting::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BUTTON_StartTask, &CDlgTaoAlexaSetting::OnBnClickedButtonStarttask)
	ON_BN_CLICKED(IDC_BUTTON_StopTask, &CDlgTaoAlexaSetting::OnBnClickedButtonStoptask)
	ON_BN_CLICKED(IDC_BUTTON_DelTask, &CDlgTaoAlexaSetting::OnBnClickedButtonDeltask)
	ON_BN_CLICKED(IDC_BUTTON_ModTask, &CDlgTaoAlexaSetting::OnBnClickedButtonModtask)
END_MESSAGE_MAP()


// CDlgTaoAlexaSetting 消息处理程序


BOOL CDlgTaoAlexaSetting::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_EditNetAddr.SetCueBanner(_T("在此处输入需要刷Alexa的网站地址"));
	m_EditNetAddr.SetWindowTextW(m_strNetAddr);
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
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}


HBRUSH CDlgTaoAlexaSetting::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_AlexaZhu) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_AlexaZhu1) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_AlexaZhu2))
	{
		pDC->SetTextColor(RGB(144,144,144));
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}


void CDlgTaoAlexaSetting::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	if (tasks.size() < MAXTASKCOUNT)
	{
		UpdateData(TRUE);
		if (m_strNetAddr.IsEmpty())
		{
			AfxMessageBox(_T("网址不能为空"));
			return;
		}
		TTaskAttribute task;
		task.nTaskIndex = tasks.size();
		task.strNetAddr =  m_strNetAddr;
		task.eType = Alexa;
		task.eStat = Running;
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


void CDlgTaoAlexaSetting::OnBnClickedButtonStarttask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = true;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Running;
	task.eAction = StartTask;
	OnOK();
}


void CDlgTaoAlexaSetting::OnBnClickedButtonStoptask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = false;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Stop;
	task.eAction = StopTask;
	OnOK();
}


void CDlgTaoAlexaSetting::OnBnClickedButtonDeltask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = DelTask;
	OnOK();
}


void CDlgTaoAlexaSetting::OnBnClickedButtonModtask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = ModTask;
	UpdateData(TRUE);
	task.eType = Alexa;
	task.strNetAddr = m_strNetAddr;
	OnOK();
}
