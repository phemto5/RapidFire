; #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force
; SendMode event
SetKeyDelay 0, 51
refreshtime := 0.72 -.13
; FireArr := [3, 4, 5, 6]
; waitpersec := (refreshtime*1000/FireArr.Length()) 
waitpersec := (refreshtime*1000/4) 
; split := waitpersec

#IfWinActive, ahk_Class CryENGINE
    RButton::
    {
        ; i:=1
        loop{
            ; wgrp := FireArr[i]
            send, 6
            sleep, %waitpersec%
            i++
            ; if (i >FireArr.Length()){
                ; i :=1
            ; }
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return
