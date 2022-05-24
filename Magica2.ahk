#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode, event
keypress = 50 

#IfWinActive, ahk_exe Magicka2.exe
    c::
        dragon := ["f","f","d","f","f"]
        Cast(dragon)
    Return

    x::
        spike := ["s","s","d","s","s"]
        Cast(spike)
    Return

    +z::
        hail := ["d","q","r","q","r","q","r","q","r"]
        thunder := ["q","f","a","s","a"]
        steamWall :=["f","q","f","q","f","q","f","q","e"]
        steamCloud :=["f","q","f","q","f","q","f","q","f","q"]
        arcne := ["s","s","s","s","e"]
        ; Cast(thunder)
        ; CastNova(steamCloud)
        ; CastNova(steamWall)
        CastOnSelf(arcne)
        
        ; CastForward(arcne)
        ; CastWall(arcne)
    Return
    z::
        hail := ["d","q","r","q","r","q","r","q","r"]
        thunder := ["q","f","a","s","a"]
        steamWall :=["f","q","f","q","f","q","f","q","e"]
        steamCloud :=["f","q","f","q","f","q","f","q","f","q"]
        arcne := ["s","s","s","s","e"]
        ; Cast(thunder)
        ; CastNova(steamCloud)
        ; CastNova(steamWall)
        ; CastForward(arcne)
        CastWall(arcne)
    Return

    v::
        haste := ["a","s","f"]
        heal := ["w","w","w","w","w"]
        ; shield :=["q","q","q","q","e"]
        ; steam :=["f","q","f","q","f","q","f","q","e"]
        ; CastOnSelf(steam)
        Cast(haste)
        CastOnSelf(heal)
    return

    b::
        revive :=["w","a"]
        Cast(revive)
    Return

    n::
     nova :=["s","r","a","r","a"]
     CastNova(nova)
     return

    CastNova(spell) {
        for i, j in spell{
            Random, keypress, 51, 60
            SetKeyDelay, 0, keypress
            send %j%
        }
        send +{MButton}
    }

    CastForward(spell) {
        for i, j in spell{
            Random, keypress, 51, 60
            SetKeyDelay, 0, keypress
            send %j%
        }
        send +{RButton}
        sleep 100
        send +{RButton}
    }
    Castwall(spell) {
        for i, j in spell{
            Random, keypress, 51, 60
            SetKeyDelay, 0, keypress
            send %j%
        }
        send {RButton}
    }

    CastOnSelf(spell) {
        for i, j in spell{
            Random, keypress, 51, 60
            SetKeyDelay, 0, keypress
            send %j%
        }
        send {MButton}
    }

    Cast(spell){
        for i, j in spell{
            Random, keypress, 51, 60
            SetKeyDelay, 0, keypress
            send %j%
        }
        send {Space}
    }
