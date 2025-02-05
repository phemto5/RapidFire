#Requires AutoHotkey v2.0
#SingleInstance Force

HotIfWinActive "Minecraft"
RButton:: {
    loop {
        Send MouseClick("Right",,,,,"D",)
        Sleep 3000
        Send MouseClick("Right",,,,,"U",)
        if !GetKeyState("RButton", "P")
            break
    }
    Return
}