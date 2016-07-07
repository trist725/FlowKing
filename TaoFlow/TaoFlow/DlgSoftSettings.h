#pragma once
#include "afxcmn.h"
#include "afxwin.h"


// CDlgSoftSettings 对话框

class CDlgSoftSettings : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgSoftSettings)

public:
	CDlgSoftSettings(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CDlgSoftSettings();

// 对话框数据
	enum { IDD = IDD_DIALOG_SoftSetting };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	CHotKeyCtrl m_hotShowHideWindow;

	CButton m_CheckStartWithWindows;

	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedCheckStartwithwindows();
	virtual BOOL OnInitDialog();

	//解决CHotKeyCtrl与RegisterHotKey中alt和shift定义相反的问题
	void RegSwitchAltShift();
	//设置/取消开机启动
	void SetStartWithWindows();
	void DontStartWithWindows();
	
	
//	BOOL M_BStartWithWindows;
};
