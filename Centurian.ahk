#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51
refreshtime := 0.72*0.90
FireArr := [4, 5, 6]
waitpersec := refreshtime*1000/FireArr.Length()

; +LButton::
;     i:=1
;     loop{
;         wgrp := FireArr[i]
;         SendRaw, %wgrp%
;         sleep waitpersec*.5
;         ; SendRaw, %wgrp%
;         ; Sleep, waitpersec*.35
;         i++
;         if (i >FireArr.Length()){
;             i :=1
;         }
;         if !GetKeyState("LButton", "P")
;             break
;     }
; Return

#IfWinActive, ahk_Class CryENGINE
    LButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            send, {LButton} 
            Sleep, waitps*.5
            if !GetKeyState("LButton", "P")
                break
        }
    }