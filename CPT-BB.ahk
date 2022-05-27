#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SendMode, event
pressTime := 51
SetKeyDelay, 0, %pressTime%
refreshtime := 3.2-.384
duration := .9
FireArr := [3,4,5,6]
waitpersec := (refreshtime+duration*1000/FireArr.Length()) 

#IfWinActive, ahk_Class CryENGINE
    RButton::
        FireWeapons(waitpersec)
    Return
    FireWeapons(waitps){
        loop{
            send, 6 
            Sleep, waitps
            if !GetKeyState("RButton", "P")
                break
        }
    }