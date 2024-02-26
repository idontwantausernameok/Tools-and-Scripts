;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script only works when Capslock is on!
;It toggle the Right Mouse button on and off.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

global RMBIsToggled := false

#HotIf GetKeyState("CapsLock", "T")
*$RButton up::ToggleRMB()
ToggleRMB()
{
	if(RMBIsToggled)
	{
		Send("{RButton up}")
	}
	else
	{
		Send("{RButton down}")
	}
	RMBIsToggled := !RMBIsToggled
}