#Requires AutoHotkey v2.0
#Usehook True
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

~a:: Send("{d Up}")
~d:: Send("{a Up}")