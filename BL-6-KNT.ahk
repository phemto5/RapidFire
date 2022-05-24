#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode, event
keypress = 50 
Random, keypress, 51, 60
SetKeyDelay, 0, 51
refreshtime := 3.5 -.341
duration := 1-.15
; FireArr := [1,2,3,4,5,6]
; waitpersec := (refreshtime*1000/FireArr.Length()) 
waitpersec := ((duration+refreshtime)*1000/6) 
; split := waitpersec/2

#IfWinActive, ahk_Class CryENGINE
    RButton::
        ; TrayTip, "FireRate", %waitpersec%
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            Random, keypress, 51, 60
            ; send, {LButton}
            send, 6
            slp := waitps
            ; TrayTip, "Sleep", %slp% 
            Sleep, %slp%
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return