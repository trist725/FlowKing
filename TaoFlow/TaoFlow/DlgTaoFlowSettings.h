#pragma once
#include "afxwin.h"
#include "afxcmn.h"

#include "TaskAttribute.h"
// CDlgTaoFlowSettings 对话框

class CDlgTaoFlowSettings : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgTaoFlowSettings)

public:
	CDlgTaoFlowSettings(CWnd* pParent = NULL);   // 标准构造函数
	CDlgTaoFlowSettings(TTaskAttribute &task, CWnd* pParent = NULL);
	virtual ~CDlgTaoFlowSettings();

	CString m_StrCaption;
	void SetCaption(LPCTSTR lpszCaption);

// 对话框数据
	enum { IDD = IDD_DIALOG_FlowFuncSetting };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnBnClickedCheckSetmaxip();
	afx_msg void OnBnClickedCheckFlowtiming();
	afx_msg void OnBnClickedButtonAddtaskstart();
	afx_msg void OnBnClickedButtonAddsourceaddr();
	afx_msg void OnBnClickedButtonAddclickaddr();
	afx_msg void OnBnClickedRadioTaoflow();
	afx_msg void OnBnClickedRadioTaopopular();
	afx_msg void OnBnClickedRadioTaoads();
	afx_msg void OnBnClickedButtonStarttask();
	afx_msg void OnBnClickedButtonStoptask();
	afx_msg void OnBnClickedButtonDeltask();
	afx_msg void OnBnClickedButtonModtask();
	afx_msg void OnBnClickedButtonDelsourceaddr();
	afx_msg void OnBnClickedButtonDelclickaddr();
	virtual BOOL OnInitDialog();

	void SetTaskType(TTaskAttribute & task);

	//control
	CEdit m_EditNetAddr;
	CEdit m_EditSourceAddr;
	CEdit m_EditClickAddr;
	CEdit m_EditStartTime;
	CEdit m_EditEndTime;
	CEdit m_EditMaxIp;

	CSpinButtonCtrl m_spinMaxIP;
	CComboBox m_ComboIpPvRatio;
	CComboBox m_ComboSourceAddr;
	CComboBox m_ComboClickAddr;
	CComboBox m_ComTaoSelection;

	CButton m_BtnStarTask;
	CButton m_BtnStopTask;
	CButton m_BtnDelTask;
	CButton m_BtnModTask;
	CButton m_checkFlowTiming;
	CButton m_BtnAddStartTask;
	CButton m_checkMaxIpPerHour;
	CButton m_RadioTaoFlow;

	CListCtrl m_listSourceAddr;
	CListCtrl m_listClickAddr;

	//value
	CString m_strNetAddr;
	int m_nMaxIpPerHour;
	int m_nStartTiming;
	int m_nEndTiming;
	int m_nTaoType;
	BOOL m_bFlowTiming;
	BOOL m_bFlowPerHour;
	int m_nIPPVRadio;

	//自定义
	ETaoFlowType m_eTaskType;
	int m_nTypeSel;
	bool m_bEntryType;
	bool m_bTaskIsRunning;
	int m_nTaskIndex;
	//来源网址列表
	std::vector<Tlist> m_vecSourceAddr;
	//点击网址列表
	std::vector<Tlist> m_vecClickAddr;
};
