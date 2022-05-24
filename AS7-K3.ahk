#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode, event
keypress = 50 
Random, keypress, 51, 60
SetKeyDelay, 0, 51
refreshtime := 0.72- .072
FireArr := [5, 6]
waitpersec := (refreshtime*1000/FireArr.Length()) 
; split := waitpersec/2

#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        i:=1
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, %waitps%
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return