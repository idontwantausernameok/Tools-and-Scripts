;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The toggle is set to CapsLock, see the AHK docs on how to change it.

;This script will click every 50ms if CapsLock is on and Mouse 1 is pressed.

#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

~*LButton::CustomClick()
CustomClick()
{
	if (GetKeyState("CapsLock", "T"))
	{
		while (GetKeyState("LButton","P"))
		{
			Click
			Sleep, 50
		}
	}
}


