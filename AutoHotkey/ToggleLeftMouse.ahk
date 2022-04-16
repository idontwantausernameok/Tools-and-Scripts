;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;

#KeyHistory 0
#NoEnv
;#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

LMBIsToggled = false

^+LButton::ToggleLMB()

ToggleLMB()
{
	LMBIsToggled := !LMBIsToggled
	Send {LButton up}

	if(LMBIsToggled)
	{
		Send {LButton down}
	}
	else
	{
		Send {LButton up}
	}
}