#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
nap := 50 

#IfWinActive, ahk_class UnrealWindow
    
    XButton1::
        fireAllWeaponsFast(nap)
    Return

    fireAllWeaponsFast(n){
        loop, {
            send, {LButton}
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

    