#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51
refreshtime := 0.72- .072
FireArr := [4, 5, 6]
waitpersec := (refreshtime*1000/FireArr.Length()) 
split := waitpersec/2

#IfWinActive, ahk_Class CryENGINE
    RButton::
        i:=1
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, split
            ; send, %wgrp%
            ; sleep, waitpers-split
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    Return

    +RButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            send, {LButton} 
            Sleep, waitps
            if !GetKeyState("RButton", "P")
                break
        }
    }