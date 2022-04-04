#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51
refreshtime := 2.1-.016
; FireArr := [5, 6]
waitpersec := (refreshtime*1000/6) 
; split := waitpersec/2

#IfWinActive, ahk_Class CryENGINE
    ; RButton::
    ;     i:=1
    ;     loop{
    ;         wgrp := FireArr[i]
    ;         send, %wgrp%
    ;         sleep, split
    ;         send, %wgrp%
    ;         sleep, waitpers-split
    ;         i++
    ;         if (i >FireArr.Length()){
    ;             i :=1
    ;         }
    ;         if !GetKeyState("RButton", "P")
    ;             break
    ;     }
    ; Return

    RButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            send, 3 ;{LButton} 
            Sleep, waitps
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return