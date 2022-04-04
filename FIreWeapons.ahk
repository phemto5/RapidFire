#SingleInstance, Force
SendMode Event
SetWorkingDir, %A_ScriptDir%

OnMessage(0x0400 , "FireWeapons")

FireWeapons(waitps,lParam,msg,hwnd){
    loop{
        send, 1 
        Sleep, waitps*.60
        if lParam
            break
        ; if !GetKeyState("LButton", "P")
        ;     break
    }
}
