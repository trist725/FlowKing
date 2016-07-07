#pragma once
#include "afxwin.h"
#include "TaskAttribute.h"

// CDlgTaoAlexaSetting 对话框

class CDlgTaoAlexaSetting : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgTaoAlexaSetting)

public:
	CDlgTaoAlexaSetting(CWnd* pParent = NULL);   // 标准构造函数
	CDlgTaoAlexaSetting(TTaskAttribute &task, CWnd* pParent = NULL);
	virtual ~CDlgTaoAlexaSetting();

// 对话框数据
	enum { IDD = IDD_DIALOG_TaoAlexaSetting };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	CEdit m_EditNetAddr;
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);

	int m_nTaskIndex;
	bool m_bEntryType;
	bool m_bTaskIsRunning;
	CButton m_BtnAddStartTask;
	CButton m_BtnModTask;
	CButton m_BtnDelTask;
	CButton m_BtnStopTask;
	CButton m_BtnStartTask;
	afx_msg void OnBnClickedOk();
	CString m_strNetAddr;
	afx_msg void OnBnClickedButtonStarttask();
	afx_msg void OnBnClickedButtonStoptask();
	afx_msg void OnBnClickedButtonDeltask();
	afx_msg void OnBnClickedButtonModtask();
};
