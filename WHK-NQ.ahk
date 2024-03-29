﻿#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 2.5-0.495
FireArr := [5, 6]
waitpersec := (refreshtime*1000/FireArr.Length()) 
split := (waitpersec/2)+pressTime

i:=1
#IfWinActive, ahk_Class CryENGINE
    RButton::
        ;  FireChain(split)
        FireBurst()
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
    FireChain(split){
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
    }
    FireBurst(){
        loop{
            send, 6
            send, 5
            send, 6
            send, 5
            Sleep, refreshtime-(pressTime*4)
            if !GetKeyState("RButton", "P")
                break
        }
    }