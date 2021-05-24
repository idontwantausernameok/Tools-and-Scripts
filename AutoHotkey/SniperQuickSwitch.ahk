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
		Click, Down
		Sleep, 30
		Click, Up
		
		Sleep, 20
		
		send {3 down}
		Sleep, 20
		send {3 up}
		
		Sleep, 50
		
		send {1 down}
		Sleep, 20
		send {1 up}
		
		Sleep, 750
		
		MouseClick, Right,0,0,1,1,D,R
		Sleep, 30
		MouseClick, Right,0,0,1,1,U,R
	}
}


