#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 3-0.228
weaponCount := 6
firegroup := [4, 5, 6]
waitpersec := (refreshtime*1000/firegroup.Length()) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        fireAllWeaponsFast(weaponCount)
        ; fireAllWeaponGroups(waitpersec,firegroup)
    Return

    ; +RButton::
    ;     ; fireAllWeaponsFast(weaponCount)
    ;     fireAllWeaponGroups(waitpersec,firegroup)
    ; Return

    fireAllWeaponGroups(waitps,fg){
        i := 1
        loop, {
            wpg := fg[i]
            send, %wpg% 
            sleep, waitps/2
            i++
            if (i >fg.Length()){
                i :=1
            }
            if !GetKeyState("RButton", "P"){
                break
            }
        }
    }

    fireAllWeaponsFast(wc){
        loop, %wc% {
            send, 3 
            Sleep, 51
        }
    }