#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
SendMode, event
SetKeyDelay, 0, 51

; ; # Source http://slanter-ahk.blogspot.de/2009/02/ahk-new-auto-clicker.html
; # This is a new 5-line autoclicker made possible with the release of AHK 1.0.48. Use Insert to toggle it on and off.
+LButton::
   #IfWinActive, Idle Champions
      {
         loop{
            send {LButton}
            if !GetKeyState("LButton", "P")
               break
         }
      }
      Return

      ; Insert::Hotkey, LButton, Toggle

