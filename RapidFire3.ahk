#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
nap := 103 

#IfWinActive, ahk_Class CryENGINE
    
    RButton::
        fireAllWeaponsFast(nap)
    Return

    fireAllWeaponsFast(n){
        loop, {
            send, 3 
            Sleep, %n%
            if !GetKeyState("RButton", "P"){
                break
            }
        }
    }

    .:: 
        nap += 10
        ; TrayTip, Speed, %nap%, 240
    Return

    ,:: 
        nap -= 10
        ; TrayTip, Speed, %nap%, 240
    Return

    