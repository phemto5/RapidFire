#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51

refreshtime := .55
weapons := 2
waitpersec := refreshtime*1000/weapons

+LButton::
    FireArr := [5, 6]
    i:=1
    loop{
        wgrp := FireArr[i]
        SendRaw, %wgrp%
        ; TrayTip, fireing, %wgrp%
        i++
        if (i >2){
            i :=1
        }
        Sleep, %waitpersec%
        if !GetKeyState("LButton", "P")
            break
    }
Return


; +LButton::
;     loop{
;         SendRaw, 1
;         Sleep, %waitpersec%
;         if !GetKeyState("LButton", "P")
;             break
;     }
; Return
