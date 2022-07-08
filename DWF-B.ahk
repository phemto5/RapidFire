; Direwolf B
; A]25<:P1|eRp01dE7|eB|eB|QR|QRq01bE7|eB|eB|QR|QRr41aE7|l^|l^|l^|lB|lB|lB|lBs41eE7|eB|QR|QR|l^tA1fE7uA1gE7|QRvB0`E7wL0D0D0

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
pressTime := 51
SetKeyDelay, 0, pressTime
refreshtime :=  1.45 - 0.052
wepcount : := 5
waitpersec := (refreshtime*1000/wepcount) 
split := waitpersec/2 ;(waitpersec/2)

#IfWinActive, ahk_Class CryENGINE
    RButton::
        i:=1
        loop{
            send, 3
            sleep, %split%
            if !GetKeyState("RButton", "P")
                break
        }
    Return