; Atlas K3
; A;=:20L1|i^|i^|i^|bd|i^|i^|i^|LGp01|i^q01|^<2|7@|\O|kOr41|_@|b?|b?s41|b?|b?t11u11vB0wP0D0D0

#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
refreshtime := 0.72 - 0.072
FireArr := [5, 6]
waitpersec := (refreshtime * 1000 / FireArr.Length())
; split := waitpersec/2

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {

    FireWeapons(waitpersec)
    Return
}

FireWeapons(waitps) {
    i := 1
    loop {
        wgrp := FireArr[i]
        Send %wgrp%
        Sleep %waitps%
        i++
        if (i > FireArr.Length()) {
            i := 1
        }
        if !GetKeyState("RButton", "P") {
            break
        }
    }
}