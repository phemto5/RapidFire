#Requires AutoHotkey v2.0 
#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
nap := (900-90)/4

TrayTip nap,"Speed"

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(nap)
    Return
}
fireAllWeaponsFast(n) {
    loop {
        Send 3
        Sleep n
        if !GetKeyState("RButton", "P") {
            ; TrayTip ("Stopping","FireControl")
            break
        }
    }
}