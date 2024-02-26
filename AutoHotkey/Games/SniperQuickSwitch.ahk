;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The toggle is set to CapsLock, see the AHK docs on how to change it.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

~*LButton::CustomClick()
CustomClick()
{
	if (GetKeyState("CapsLock", "T"))
	{
		Click("Down Left")
		Sleep(30)
		Click("Up Left")
		
		Sleep(20)
		
		Send("{3 down}")
		Sleep(20)
		Send("{3 up}")
		
		Sleep(50)
		
		Send("{1 down}")
		Sleep(20)
		Send("{1 up}")
		
		Sleep(750)
		
		MouseClick("Right",0,0,1,1,"D","R")
		Sleep(30)
		MouseClick("Right",0,0,1,1,"U","R")
	}
}


