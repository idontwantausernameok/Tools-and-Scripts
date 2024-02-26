;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The script prevents the file menu from showing up when you press Left Alt.
;It does so by simply pressing the Escape key when you release Left Alt.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

~LAlt::return
LAlt Up::Send("{Escape}")