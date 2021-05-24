;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;

#NoEnv
;#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

ShiftIsToggled = false

^LShift::ToggleShift()

ToggleShift()
{
	ShiftIsToggled := !ShiftIsToggled
	Send {LShift up}

	if(ShiftIsToggled)
	{
		Send {LShift down}
	}
	else
	{
		Send {LShift up}
	}
}