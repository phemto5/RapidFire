#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 3.75-.45
weaponCount := 9
firegroup := [4, 5, 6]
waitpersec := (refreshtime*1000/firegroup.Length()) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        
        fireAllWeaponsFast(weaponCount)

    Return

    +RButton::

        fireAllWeaponGroups(waitpersec,firegroup)

    Return
    
    fireAllWeaponGroups(waitps,fg){
        i := 1
        loop, {
            wpg := fg[i]
            ; TrayTip, Loop, %wpg% - %i% - %waitps%, 10
            send, %wpg% 
            sleep, 200
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
            Sleep, 15 
        }
    }