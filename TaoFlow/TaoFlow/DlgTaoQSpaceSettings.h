#pragma once
#include "afxwin.h"
#include "def.h"
#include "TaskAttribute.h"

// CDlgTaoQSpaceSettings 对话框

class CDlgTaoQSpaceSettings : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgTaoQSpaceSettings)

public:
	CDlgTaoQSpaceSettings(CWnd* pParent = NULL);   // 标准构造函数
	CDlgTaoQSpaceSettings(TTaskAttribute &task, CWnd* pParent = NULL);
	virtual ~CDlgTaoQSpaceSettings();

// 对话框数据
	enum { IDD = IDD_DIALOG_TaoQSpaceSettings };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);

	int m_nTaskIndex;
	bool m_bEntryType;
	bool m_bTaskIsRunning;
	CEdit m_EditQNumber;
	CString m_strQNumber;
	CButton m_BtnAddStartTask;
	CButton m_BtnModTask;
	CButton m_BtnDelTask;
	CButton m_BtnStopTask;
	CButton m_BtnStartTask;
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedButtonStarttask();
	afx_msg void OnBnClickedButtonStoptask();
	afx_msg void OnBnClickedButtonDeltask();
	afx_msg void OnBnClickedButtonModtask();
};
