// DlgAboutBox.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgAboutBox.h"
#include "afxdialogex.h"
#include "def.h"

// CDlgAboutBox 对话框

IMPLEMENT_DYNAMIC(CDlgAboutBox, CDialogEx)

CDlgAboutBox::CDlgAboutBox(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgAboutBox::IDD, pParent)
{

}

CDlgAboutBox::~CDlgAboutBox()
{
}

void CDlgAboutBox::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_STATIC_Serial, m_stcMachSerial);
}


BEGIN_MESSAGE_MAP(CDlgAboutBox, CDialogEx)
//	ON_WM_CREATE()
	ON_WM_CTLCOLOR()
END_MESSAGE_MAP()


// CDlgAboutBox 消息处理程序


//int CDlgAboutBox::OnCreate(LPCREATESTRUCT lpCreateStruct)
//{
//	if (CDialogEx::OnCreate(lpCreateStruct) == -1)
//		return -1;
//
//	// TODO:  在此添加您专用的创建代码
//
//	return 0;
//}


HBRUSH CDlgAboutBox::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialogEx::OnCtlColor(pDC, pWnd, nCtlColor);

	// TODO:  在此更改 DC 的任何特性
	if ((pWnd->GetDlgCtrlID() == IDC_STATIC_MachineSerial) ||
		(pWnd->GetDlgCtrlID() == IDC_STATIC_Serial))
	{
		pDC->SetTextColor(RGB(0, 0, 255));
	}
	// TODO:  如果默认的不是所需画笔，则返回另一个画笔
	return hbr;
}


BOOL CDlgAboutBox::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_stcMachSerial.SetWindowTextW(GetSerialNum());
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}
