;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script only works when Capslock is on!
;It toggle the Right Mouse button on and off.

#KeyHistory 0
#NoEnv
#SingleInstance
#UseHook
SendMode Input
SetWorkingDir %A_ScriptDir%

global RMBIsToggled := false

#if GetKeyState("CapsLock", "T")
*$RButton up::ToggleRMB()

ToggleRMB()
{
	if(RMBIsToggled)
	{
		Send {RButton up}
	}
	else
	{
		Send {RButton down}
	}
	RMBIsToggled := !RMBIsToggled
}