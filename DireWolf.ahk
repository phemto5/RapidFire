#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, pressTime
refreshtime :=1.45-0.052
FireArr := [1,3,4,5,6]
waitpersec := (refreshtime*1000/FireArr.Length()) 
split := waitpersec ;(waitpersec/2)
; waitpersec = split ;+pressTime
mod := -(pressTime*2)
; waitpersec += mod

; waitpersec := split

i:=1
#IfWinActive, ahk_Class CryENGINE
    RButton::
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, %split%
            ; send, %wgrp%
            ; sleep, %split%
            ; send, %wgrp%
            ; sleep, waitpersec-pressTime
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    Return

    +LButton::
        FireWeapons(waitpersec+0)
    Return

    FireWeapons(waitps){
        loop{
            send, 6 
            Sleep, %waitps%
            if !GetKeyState("LButton", "P")
                break
        }
    }