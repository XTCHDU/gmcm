// staff.h : main header file for the STAFF application
//

#if !defined(AFX_STAFF_H__74D746B5_CA4D_11D6_AC89_00010240D2AE__INCLUDED_)
#define AFX_STAFF_H__74D746B5_CA4D_11D6_AC89_00010240D2AE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CStaffApp:
// See staff.cpp for the implementation of this class
//

class CStaffApp : public CWinApp
{
public:
	CStaffApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStaffApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CStaffApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STAFF_H__74D746B5_CA4D_11D6_AC89_00010240D2AE__INCLUDED_)
