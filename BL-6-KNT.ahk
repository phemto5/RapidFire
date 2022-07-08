; Black Knight
; 0Ao4820@1|i^|i^|i^|Tdpg0|i^|]?|]?qg0|i^|]?|]?r`0|]?|i^s`0|i^|]?|i^ta0ua0vB0w<09090

#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode, event
SetKeyDelay, 0, 51
refreshtime := 4 -.341
duration := 1.1-.15
waitpersec := ((duration+refreshtime)*1000/6) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireWeapons(waitpersec)
    Return

    FireWeapons(waitps){
        loop{
            send, 3
            Sleep, %waitps%
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return