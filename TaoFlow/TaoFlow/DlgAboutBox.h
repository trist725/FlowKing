#pragma once
#include "afxwin.h"


// CDlgAboutBox 对话框

class CDlgAboutBox : public CDialogEx
{
	DECLARE_DYNAMIC(CDlgAboutBox)

public:
	CDlgAboutBox(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CDlgAboutBox();

// 对话框数据
	enum { IDD = IDD_ABOUTBOX };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
//	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	CStatic m_stcMachSerial;
	virtual BOOL OnInitDialog();
};
