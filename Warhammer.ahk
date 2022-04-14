#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 1.4
FireArr := [6]
waitpersec := (refreshtime*1000/FireArr.Length()) 
split := waitpersec/2

i:=1
#IfWinActive, ahk_Class CryENGINE
    +RButton::
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, waitpersec-pressTime
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    Return

    RButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            send, 6
            Sleep, waitps
            if !GetKeyState("RButton", "P")
                break
        }
    }