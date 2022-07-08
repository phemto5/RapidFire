; Blackjack 1(C)
; Aj1820Z0|Ad|OGpQ0|OG|i^|Y?qQ0|OG|5P|5P|[<2|Y?rL0|M@|Y?sL0|M@|Y?t[0u[0vB0w>0;0;0

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51
refreshtime := 0.72
FireArr := [5, 6]
waitpersec := (refreshtime*100/FireArr.Length()) 
split := waitpersec*.75

#IfWinActive, ahk_Class CryENGINE
    RButton::
        i:=1
        loop{
            wgrp := FireArr[i]
            send, %wgrp%
            sleep, split
            i++
            if (i >FireArr.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P")
                break
        }
    Return

    ; +RButton::
    ;     FireWeapons(waitpersec)
    ; Return

    ; FireWeapons(waitps){
    ;     loop{
    ;         send, {LButton} 
    ;         Sleep, waitps
    ;         if !GetKeyState("RButton", "P")
    ;             break
    ;     }
    ; }