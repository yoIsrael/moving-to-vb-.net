VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CheckingAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Account VB6 example #1
' Copyright �2002 by Desaware Inc.  All Rights Reserved
Option Explicit

Private m_AccountBalance As Currency

Public Sub Deposit(ByVal Amount As Currency)
    m_AccountBalance = m_AccountBalance + Amount
End Sub

Public Sub Withdraw(ByVal Amount As Currency)
    If Amount > m_AccountBalance Then
        Err.Raise vbError + 1, "CheckingAccount", "Insufficient funds"
    End If
    m_AccountBalance = m_AccountBalance - Amount
End Sub

Public Function ChargeAccount() As Currency
    Dim AmountToCharge As Currency
    If m_AccountBalance < 1000 Then AmountToCharge = 20
    Withdraw AmountToCharge
    ChargeAccount = AmountToCharge
End Function

