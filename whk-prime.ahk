#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
nap := 510
; nap := ((5 - 0.48) * 1000 / 4)

TrayTip nap, "Speed"

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(nap)
    Return
}
fireAllWeaponsFast(n) {
    toggle := 3
    loop {
        if toggle == 3 {
            Send (3)
            toggle := 4
        } else {
            Send (4)
            toggle := 3
        }
        Sleep n
        if !GetKeyState("RButton", "P") {
            ; TrayTip ("Stopping","FireControl")
            break
        }
    }
}