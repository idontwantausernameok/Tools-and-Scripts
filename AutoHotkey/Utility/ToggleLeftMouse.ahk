;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script only works when Capslock is on!
;It toggle the Left Mouse button on and off.

#KeyHistory 0
#NoEnv
#SingleInstance
#UseHook
SendMode Input
SetWorkingDir %A_ScriptDir%

global LMBIsToggled := false

#if GetKeyState("CapsLock", "T")
*$LButton up::ToggleLMB()

ToggleLMB()
{
	if(LMBIsToggled)
	{
		Send {LButton up}
	}
	else
	{
		Send {LButton down}
	}
	LMBIsToggled := !LMBIsToggled
}