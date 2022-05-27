#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 3.75-.45
weaponCount := 8
waitpersec := (refreshtime*1000/weaponCount) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireWeapons(waitpersec,pressTime)
    Return
    +RButton::
        FireWeaponsBurst(weaponCount)
    Return
    FireWeapons(waitps,pt){
        loop{
            SetKeyDelay, 0, %pt%
            send, 6 
            Sleep, waitps
            if !GetKeyState("RButton", "P")
                break
        }
    }
    FireWeaponsBurst(wc){
        loop, %wc% {
            send, 5 
            Sleep, 250/%wc%
        }
    }