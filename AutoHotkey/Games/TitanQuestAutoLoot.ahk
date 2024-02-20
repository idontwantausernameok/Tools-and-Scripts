;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The toggle is set to CapsLock, see the AHK docs on how to change it.

;This script only works when Capslock is on!
;It will click every 20ms while Mouse 1 is pressed.

#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

#if GetKeyState("CapsLock", "T")
	~*LButton::CustomClick()
	CustomClick()
	{
		while (GetKeyState("LButton","P"))
		{
			Click, X1
			Sleep, 20
		}
	}

