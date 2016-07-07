// DlgSoftSettings.cpp : 实现文件
//

#include "stdafx.h"
#include "TaoFlow.h"
#include "DlgSoftSettings.h"
#include "afxdialogex.h"

extern int g_nHotKeyId;
extern WORD g_wVirtualKeyCode;
extern WORD g_wModifiers;
extern BOOL g_BStartWithWindows;

// CDlgSoftSettings 对话框

IMPLEMENT_DYNAMIC(CDlgSoftSettings, CDialogEx)

CDlgSoftSettings::CDlgSoftSettings(CWnd* pParent /*=NULL*/)
	: CDialogEx(CDlgSoftSettings::IDD, pParent)
{

}

CDlgSoftSettings::~CDlgSoftSettings()
{

}

void CDlgSoftSettings::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_HOTKEY_ShowHideSoft, m_hotShowHideWindow);
	DDX_Control(pDX, IDC_CHECK_StartWithWindows, m_CheckStartWithWindows);
	//  DDX_Check(pDX, IDC_CHECK_StartWithWindows, M_BStartWithWindows);
}


BEGIN_MESSAGE_MAP(CDlgSoftSettings, CDialogEx)
	ON_BN_CLICKED(IDOK, &CDlgSoftSettings::OnBnClickedOk)
	ON_BN_CLICKED(IDC_CHECK_StartWithWindows, &CDlgSoftSettings::OnBnClickedCheckStartwithwindows)
END_MESSAGE_MAP()


// CDlgSoftSettings 消息处理程序


void CDlgSoftSettings::OnBnClickedOk()
{
	// TODO: 在此添加控件通知处理程序代码
	UnregisterHotKey(AfxGetMainWnd()->m_hWnd, g_nHotKeyId);
	m_hotShowHideWindow.GetHotKey(g_wVirtualKeyCode, g_wModifiers);
	RegSwitchAltShift();
	CDialogEx::OnOK();
}


BOOL CDlgSoftSettings::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  在此添加额外的初始化
	m_hotShowHideWindow.SetHotKey(g_wVirtualKeyCode, g_wModifiers);
	m_hotShowHideWindow.GetHotKey(g_wVirtualKeyCode, g_wModifiers);
	RegSwitchAltShift();

	m_CheckStartWithWindows.SetCheck(g_BStartWithWindows);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 异常: OCX 属性页应返回 FALSE
}

void CDlgSoftSettings::RegSwitchAltShift()
{
	if ((g_wModifiers & HOTKEYF_ALT) && !(g_wModifiers & HOTKEYF_SHIFT) )//Shift->ALt
	{
		g_wModifiers &= ~HOTKEYF_ALT;
		g_wModifiers |= MOD_ALT;
		RegisterHotKey(AfxGetMainWnd()->m_hWnd, g_nHotKeyId, g_wModifiers, g_wVirtualKeyCode);
		//在恢复到CHotKeyCtrl,以便下次显示
		g_wModifiers |= HOTKEYF_ALT;
		g_wModifiers &= ~MOD_ALT;
	}
	else if (!(g_wModifiers & HOTKEYF_ALT) && (g_wModifiers & HOTKEYF_SHIFT))//Alt->Shift
	{
		g_wModifiers &= ~HOTKEYF_SHIFT;
		g_wModifiers |= MOD_SHIFT;
		RegisterHotKey(AfxGetMainWnd()->m_hWnd, g_nHotKeyId, g_wModifiers, g_wVirtualKeyCode);

		g_wModifiers |= HOTKEYF_SHIFT;
		g_wModifiers &= ~MOD_SHIFT;  
	}
	else
	{
		RegisterHotKey(AfxGetMainWnd()->m_hWnd, g_nHotKeyId, g_wModifiers, g_wVirtualKeyCode);
	}
}

void CDlgSoftSettings::OnBnClickedCheckStartwithwindows()
{
	// TODO: 在此添加控件通知处理程序代码
	if (m_CheckStartWithWindows.GetCheck())
	{
		g_BStartWithWindows = TRUE;
		SetStartWithWindows();
	} 
	else
	{
		g_BStartWithWindows = FALSE;
		DontStartWithWindows();
	}
}

void CDlgSoftSettings::SetStartWithWindows()
{
	HKEY hKey;   
	//找到系统的启动项   
	LPCTSTR lpRun = _T("Software\\Microsoft\\Windows\\CurrentVersion\\Run");   
	//打开启动项Key   
	long lRet = RegOpenKeyEx(HKEY_LOCAL_MACHINE, lpRun, 0, KEY_WRITE, &hKey);
	if(lRet == ERROR_SUCCESS)   
	{   
		TCHAR pFileName[MAX_PATH] = {0};   
		//得到程序自身的全路径   
		DWORD dwRet = GetModuleFileName(NULL, pFileName, MAX_PATH);   
		//添加一个子Key,并设置值
		lRet = RegSetValueEx(hKey, _T("TaoFlow"), 0, REG_SZ, (BYTE *)pFileName, dwRet);   
		//关闭注册表   
		RegCloseKey(hKey);   
		if(lRet != ERROR_SUCCESS)   
		{   
			AfxMessageBox(_T("系统参数错误,不能完成开机启动设置"));   
		}   
		else  
		{  
			AfxMessageBox(_T("设置开机启动成功"));   
		}
	}   
}

void CDlgSoftSettings::DontStartWithWindows()
{
	HKEY hKey;   
	//找到系统的启动项   
	LPCTSTR lpRun = _T("Software\\Microsoft\\Windows\\CurrentVersion\\Run");   
	//打开启动项Key   
	long lRet = RegOpenKeyEx(HKEY_LOCAL_MACHINE, lpRun, 0, KEY_WRITE, &hKey);   
	if(lRet == ERROR_SUCCESS)   
	{   
		TCHAR pFileName[MAX_PATH] = {0};   
		//得到程序自身的全路径   
		DWORD dwRet = GetModuleFileName(NULL, pFileName, MAX_PATH);   
		//添加一个子Key,并设置值
		lRet = RegDeleteValue(hKey, _T("TaoFlow"));  
		//关闭注册表   
		RegCloseKey(hKey);
		if(lRet != ERROR_SUCCESS)   
		{   
			AfxMessageBox(_T("系统参数错误,不能完成取消开机启动设置"));   
		}   
		else{  
			AfxMessageBox(_T("取消开机启动成功"));   
		} 
	}
}
