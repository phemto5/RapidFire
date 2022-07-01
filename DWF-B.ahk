#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, pressTime
refreshtime := 1.45 - 0.052
FireArr := [3,3,3,3,3]
waitpersec := (refreshtime*1000/FireArr.Length()) 
split := waitpersec/2 ;(waitpersec/2)

#IfWinActive, ahk_Class CryENGINE
    RButton::
        i:=1
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, %split%
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    Return