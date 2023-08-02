#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
nap := ((3-.51)*1000/8)

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
; .:: {
;     nap += 100
;      TrayTip Speed, nap, 240
;     Return
; }
; ,:: {
;     nap -= 100
;      TrayTip Speed, nap, 240
;     Return
; }