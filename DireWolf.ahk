﻿#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51

refreshtime := 1.20
weapons := 5
waitpersec := refreshtime*1000/weapons

+LButton::

    FireArr := [3, 4, 5, 6]
    i:=1
    loop{
        wgrp := FireArr[i]
        send, %wgrp%
        sleep 100

        i++
        if (i > 4){
            i :=1
        }
        sleep waitpersec-100
        if !GetKeyState("LButton", "P")
            break
    }

Return

#IfWinActive, ahk_Class CryENGINE
    LButton::
        FireWeapons(waitpersec)
    Return



FireWeapons(waitps){
    loop{
        send, {LButton} 
        Sleep, waitps*.5
        if !GetKeyState("LButton", "P")
            break
    }
}