;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The toggle is set to CapsLock, see the AHK docs on how to change it.

;This script only works when Capslock is on!
;It will click every 20ms while Mouse 1 is pressed.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

#HotIf GetKeyState("CapsLock", "T")
~*LButton::CustomClick()
CustomClick()
{
	while (GetKeyState("LButton","P"))
	{
		Click("Left")
		Sleep(20)
	}
}


