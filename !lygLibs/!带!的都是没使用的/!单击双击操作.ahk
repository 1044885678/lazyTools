#SingleInstance Force
; ����ͳ�ư����Ĵ���
gnPressCount := 0
$Ctrl::
{
        gnPressCount += 1
        SetTimer, ProcSubroutine, Off
        SetTimer, ProcSubroutine, 300
        Return
}
ProcSubroutine:
{
        ; �ڼ�ʱ��ʱ�䴥��ʱ, ��Ҫ����ص�
        SetTimer, ProcSubroutine, Off
        If gnPressCount = 1
        {
                ; ��һ����Ϊ
                MsgBox, ������Ctrl
        }Else If gnPressCount = 2
        {
                ; �ڶ�����Ϊ
                MsgBox,˫����Ctrl
        }Else
        {
                MsgBox, ��������
        }
        ; �ڽ�����, ����Ҫ�� ** �����İ�����������Ϊ0, �����´μ���ʹ��
        gnPressCount := 0
        Return
}