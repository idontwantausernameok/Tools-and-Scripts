;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script is meant to be used with Clumsy Network Testing Utility.
;The toggle is set to Mouse4 or 5, see the AHK docs on how to change it.
;This script will Toggle a checkbox titled "Lag" on a window called:
;"clumsy 0.2"

;This can be adapted for other programs, fairly easily.
;#Usehook
#Warn All, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

XButton2::Toggle()
Toggle()
{
    ControlSetChecked(-1, "Lag", "clumsy 0.2")
}
Return