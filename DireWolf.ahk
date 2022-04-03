#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51

refreshtime := 0.58
weapons := 4
waitpersec := refreshtime*1000/weapons

+LButton::

    FireArr := [3, 4, 5, 6]
    i:=1
    loop{
        wgrp := FireArr[i]
        SendRaw, %wgrp%
        ; TrayTip, fireing, %wgrp%
        i++
        if (i > 4){
            i :=1
        }
        Sleep, %waitpersec%
        if !GetKeyState("LButton", "P")
            break
    }

Return

