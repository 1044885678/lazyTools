; SciTE4AutoHotkey v3 user autorun script
;
; You are encouraged to edit this script!
;

#NoEnv
#NoTrayIcon
SetWorkingDir, %A_ScriptDir%

/*
����TAB ��ʼ

˵��:
SendInput ���Ϳ�ݼ��ǲ�һ����Ч��
������ȫ��ʹ�� Send ����

BUG:
������߲�����ת�����������
��ʱ��Ī�����ļ���
*/
����Tab:
	��� := 0
	oSciTE := ComObjActive("SciTE4AHK.Application")
	SciTE_Hwnd := oSciTE.SciTEHandle
	;��SciTE�˳�
	WinWaitClose, ahk_id %SciTE_Hwnd%
	ExitApp
Return

;Ctrl+Enter����������һ��
/*
#If !WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
$^Enter::
	Send, {End}
	Send, {Enter}
Return
*/
;�Զ����״̬��,ʹ��Tab��չ��������,��ѡ�е�һ������
#If (���=0) and WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
~$Tab::
	Send, ^b											;չ��������
	Send, ^+{Right}											;���������ļ����Ѿ����ù����λ��Ϊ����ǰ,��������ֱ��ѡ����һ���ʾ�����
	��� := 1
	ToolTip, ����Tab ������
Return

;ʹ��Tab�ڲ�������Ծ
#If  (���=1) and !WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
$Tab::
	If (oSciTE.Selection<>"")									;��ǰ����ѡ������,�����Ҽ�ͷȡ��ѡ��״̬
		Send, {Right}
	Loop,25
	{
		Send, ^+{Right}										;ѡ�����浥��
		ѡ���ı� := oSciTE.Selection								;��ȡ��ѡ�е�����
		If (ѡ���ı�="")									;���һ��
		{
			Send, {Right}
			Send, {Enter}
			��� := 0
			ToolTip,
			Return
		}
		Else If (SubStr(ѡ���ı�, 1, 2)="`r`n" or SubStr(ѡ���ı�, -1, 2)="`r`n")		;��ĩ
		{
			Send, ^{Left}
			Send, {Enter}
			��� := 0
			ToolTip,
			Return
		}
		Else If (SubStr(ѡ���ı�, 0, 1)=")")							;�������ŵ���ĩ
		{
			Send, {Right}
			Continue
		}
		Else If (SubStr(RTrim(ѡ���ı�, " `t`r`n`v`f"), 0, 1)=",")				;���ź���Ĳ���
		{
			Send, {Right}
			Send, ^+{Right}
			Return
		}
		Else If (Trim(SubStr(ѡ���ı�, -3, 4), " `t`r`n`v`f")="in")				;רΪ for ����
		{
			Send, {Right}
			Send, ^+{Right}
			Return
		}
	}
	��� := 0
	ToolTip,
Return

$NumpadEnter::
$Enter::
	If (oSciTE.Selection<>"")									;��ǰ����ѡ������,�����Ҽ�ͷȡ��ѡ��״̬
		Send, {Right}
	Send, !+{End}											;ѡ�����ֵ���ĩ
	If (SubStr(RTrim(oSciTE.Selection, " `t`r`n`v`f"), 0, 1)=")")					;��������һ���ǿհ��ַ��Ƿ��Ǳ�����,����һ��������
		Send, )
	Send, {Enter}
	��� := 0
	ToolTip,
Return
#If
/*
����TAB ����
*/