#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode, event
keypress = 50 
Random, keypress, 51, 60
SetKeyDelay, 0, 51
refreshtime := 3.75-.112
waitpersec := ((refreshtime)*1000/12) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        ; FireWeapons(waitpersec)
        BurstFire()
    Return

    FireWeapons(waitps){
        loop{
            Random, keypress, 51, 60
            send, 6
            slp := waitps
            Sleep, %slp%
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return
    BurstFire(){
        loop{
            Random, keypress, 51, 60
            send, 6
            Sleep, 100
            if !GetKeyState("RButton", "P")
                break
        }
    }
    Return