; Black Knight
; 0Ao4820@1|i^|i^|i^|Tdpg0|i^|]?|]?qg0|i^|]?|]?r`0|]?|i^s`0|i^|]?|i^ta0ua0vB0w<09090

#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
refreshtime := 4 - 0.341
duration := 1.1 - 0.15
waitpersec := ((duration + refreshtime) * 1000 / 6)

TrayTip waitpersec, "Speed"
HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(waitpersec)
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