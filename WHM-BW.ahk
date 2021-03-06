#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
refreshtime := 1.4
Random, pressTime, 50, 60
SetKeyDelay, 0, %pressTime%
waitpersec := (refreshtime*1000/FireArr.Length()) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        loop{
            Random, pressTime, 50, 60
            send, 6
            sleep, waitpersec
            if !GetKeyState("RButton", "P")
                break
        }
    Return
