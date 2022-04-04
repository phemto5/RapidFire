#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

fire = False
LButton::
    fire = !fire
    SendMessage, 0x0400 , 300, %fire%, "C:\Users\nicho\projects\RapidFire\Centurian.ahk - AutoHotkey v1.1.33.10"
    ; SendMessage, Msg, [wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText, Timeout]
    Return