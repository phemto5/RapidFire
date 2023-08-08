#SingleInstance Force
; #Requires Autohotkey2.0
SetWorkingDir A_ScriptDir
SendMode "Event"
pressTime := 51
SetKeyDelay 0, pressTime
milliseconds := 1000
GhostHeatDelay := 500
HSL := 2
Durration := (1 - 0.15) * milliseconds
cooldown := (3.5 - 0.336) * milliseconds
weaponCount := 5

heatEff := 1.4 / 2

hslbase := ((GhostHeatDelay / hsl) + Durration) * heatEff
cooldownBase := ((cooldown + Durration) / weaponCount) * heatEff


if (hslbase < cooldownBase) {
    nap := hslbase
} else {
    nap := cooldownBase
}
message := "Naptime is " nap " and " hslbase " and " cooldownBase
TrayTip message, "Speed"

HotIfWinActive "ahk_Class, CryENGINE"
RButton:: {
    fireAllWeaponsFast(nap)
    Return
}
fireAllWeaponsFast(n) {
    loop {
        Send (3)
        Sleep n
        if !GetKeyState("RButton", "P") {
            break
        }
    }
}