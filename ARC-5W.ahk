; Archer 6W
; A:682041|i^|Od|i^|7@p`0|[<2|7@|7@|\O|\O|\Oq`0|[<2|7@|7@|\O|\O|\O|\Or\0|7@|7@s\0|7@|7@tk0uk0vB0wD0<0<0

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
        ; FireInBursts()
        FireInSequesnce()
    Return

    FireInSequesnce()
    {
        loop, {
            send, 3 
            Sleep, waitpersec/weaponCount
            if !GetKeyState("RButton", "P"){
                break
            }
        }
    }

    FireInBursts(){
        i:=1
        loop, {
            wgrp := firegroup[i]
            send, %wgrp%
            sleep, %waitpersec%
            i++
            if (i >firegroup.Length()){
                i :=1
            }            
            if !GetKeyState("RButton", "P"){
                break
            }
        }
    }
    