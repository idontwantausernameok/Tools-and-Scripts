;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.
;This script will Send("a "Menu Key" aka "Shift+F10" keypress when tapping Right Alt and Right Ctrl at the same time.")

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

RCtrl & RAlt::Send("+{F10}")
RAlt & RCtrl::Send("+{F10}")