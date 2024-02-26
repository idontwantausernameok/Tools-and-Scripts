;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script only works when Capslock is on!
;It toggle the Left Mouse button on and off.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

global LMBIsToggled := false

#HotIf GetKeyState("CapsLock", "T")
*$LButton up::ToggleLMB()
ToggleLMB()
{
	if(LMBIsToggled)
	{
		Send("{LButton up}")
	}
	else
	{
		Send("{LButton down}")
	}
	LMBIsToggled := !LMBIsToggled
}