﻿#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
pauseTime := 51
weaponCount := 3
nap := ((1000 - (weaponCount * 51)) / 3)

TrayTip nap, "Speed"

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(nap, pauseTime)

}
fireAllWeaponsFast(n, s) {
    loop {
        Send 3
        Sleep s
        Send 3
        Sleep n
        if !GetKeyState("RButton", "P") {
            ; TrayTip ("Stopping","FireControl")
            break
        }
    }
}