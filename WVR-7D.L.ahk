#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, pressTime
refreshtime := 1.45-0.239
FireArr := [6]
waitpersec := (refreshtime*1000/FireArr.Length())
split := waitpersec/2

i:=1
#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireBurst(split,pressTime)
        ; FireWeapons(split)
    Return

    ; +RButton::
    ;     FireWeapons(waitpersec)
    ; Return

    FireBurst(wps, ptime ){
        loop{
            send, 6
            sleep wps
            send, 6
            sleep, wps
            if !GetKeyState("RButton", "P")
                break
        }
    }

    FireWeapons(wps){
        loop{
            send, 6
            Sleep, %wps%
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