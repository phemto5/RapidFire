#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime

nap := 250

TrayTip nap,"Speed"

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(nap)
    Return
}
fireAllWeaponsFast(n) {
    loop {
        play := (Random()*20)
        Send 3
        Sleep n+play
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