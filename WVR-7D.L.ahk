#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, pressTime
refreshtime := 0.72-0.119
FireArr := [5, 6]
waitpersec := (refreshtime*1000/FireArr.Length())*1.1
split := waitpersec/2

i:=1
#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireBurst(waitpersec,pressTime,FireArr)
    Return

    ; +RButton::
    ;     FireWeapons(waitpersec)
    ; Return

    FireBurst(wps, ptime, fArr){
        loop{
            for ind,wgrp in fArr{
                send, %wgrp%
                sleep 50
                send, %wgrp%
            }
            sleep, wps-(ptime*2)-100
            if !GetKeyState("RButton", "P")
                break
        }
    }

    FireWeapons(wps){
        loop{
            send, 4
            Sleep, wps
            if !GetKeyState("RButton", "P")
                break
        }
    }
    FireEvenPace(wps,sp, fArr){
        loop{
            wgrp := fArr[i]
            send, %wgrp%
            sleep, %sp%
            send, %wgrp%
            sleep, wps-sp
            i++
            if (i >fArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    }