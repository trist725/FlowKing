// DlgTaoQSpaceSettings.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgTaoQSpaceSettings.h"
#include "afxdialogex.h"

extern std::vector<TTaskAttribute> tasks;

// CDlgTaoQSpaceSettings 对话框

IMPLEMENT_DYNAMIC(CDlgTaoQSpaceSettings, CDialogEx)

CDlgTaoQSpaceSettings::CDlgTaoQSpaceSettings(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgTaoQSpaceSettings::IDD, pParent)
	, m_bEntryType(FALSE)
	, m_bTaskIsRunning(TRUE)
	, m_strQNumber(_T(""))
{

}

CDlgTaoQSpaceSettings::CDlgTaoQSpaceSettings(TTaskAttribute &task, CWnd* pParent)
	: CDialogEx(CDlgTaoQSpaceSettings::IDD, pParent)
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
	m_strQNumber = task.strQNumber;
	m_nTaskIndex = task.nTaskIndex;
}

CDlgTaoQSpaceSettings::~CDlgTaoQSpaceSettings()
{
}

void CDlgTaoQSpaceSettings::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT1, m_EditQNumber);
	DDX_Text(pDX, IDC_EDIT1, m_strQNumber);
	DDX_Control(pDX, IDOK, m_BtnAddStartTask);
	DDX_Control(pDX, IDC_BUTTON_ModTask, m_BtnModTask);
	DDX_Control(pDX, IDC_BUTTON_DelTask, m_BtnDelTask);
	DDX_Control(pDX, IDC_BUTTON_StopTask, m_BtnStopTask);
	DDX_Control(pDX, IDC_BUTTON_StartTask, m_BtnStartTask);
}


BEGIN_MESSAGE_MAP(CDlgTaoQSpaceSettings, CDialogEx)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDOK, &CDlgTaoQSpaceSettings::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BUTTON_StartTask, &CDlgTaoQSpaceSettings::OnBnClickedButtonStarttask)
	ON_BN_CLICKED(IDC_BUTTON_StopTask, &CDlgTaoQSpaceSettings::OnBnClickedButtonStoptask)
	ON_BN_CLICKED(IDC_BUTTON_DelTask, &CDlgTaoQSpaceSettings::OnBnClickedButtonDeltask)
	ON_BN_CLICKED(IDC_BUTTON_ModTask, &CDlgTaoQSpaceSettings::OnBnClickedButtonModtask)
END_MESSAGE_MAP()


// CDlgTaoQSpaceSettings 消息处理程序


BOOL CDlgTaoQSpaceSettings::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_EditQNumber.SetCueBanner(_T("请在此处输入您的QQ号"));
	m_EditQNumber.SetWindowTextW(m_strQNumber);
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


HBRUSH CDlgTaoQSpaceSettings::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_Zhu) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_Zhu1) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_Zhu2))
	{
		pDC->SetTextColor(RGB(144,144,144));
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}


void CDlgTaoQSpaceSettings::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	if (tasks.size() < MAXTASKCOUNT)
	{
		UpdateData(TRUE);
		if (m_strQNumber.IsEmpty())
		{
			AfxMessageBox(_T("请填入您的QQ号"));
			return;
		}
		TTaskAttribute task;
		task.nTaskIndex = tasks.size();
		task.strQNumber =  m_strQNumber;
		task.eType = QSpace;
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


void CDlgTaoQSpaceSettings::OnBnClickedButtonStarttask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = true;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Running;
	task.eAction = StartTask;
	OnOK();
}


void CDlgTaoQSpaceSettings::OnBnClickedButtonStoptask()
{
	// TODO: 在此添加控件通知处理程序代码
	m_bTaskIsRunning = false;
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eStat = Stop;
	task.eAction = StopTask;
	OnOK();
}


void CDlgTaoQSpaceSettings::OnBnClickedButtonDeltask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = DelTask;
	OnOK();
}


void CDlgTaoQSpaceSettings::OnBnClickedButtonModtask()
{
	// TODO: 在此添加控件通知处理程序代码
	TTaskAttribute &task = tasks.at(m_nTaskIndex);
	task.eAction = ModTask;
	UpdateData(TRUE);
	task.eType = QSpace;
	task.strQNumber = m_strQNumber;
	OnOK();
}
