#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%

#IfWinActive, ahk_Class CryENGINE
    RButton::
        fireAllWeaponsFast()
    Return

    fireAllWeaponsFast(){
        loop, {
            send, 3 
            Sleep, 150
            if !GetKeyState("RButton", "P"){
                break
            }
        }
    }