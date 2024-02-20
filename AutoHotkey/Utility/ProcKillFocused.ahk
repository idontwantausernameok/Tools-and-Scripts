;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + End, see the AHK docs on how to change it.

;This script will kill all processes inside the ToKillArray.
;Put the executable name in double quotes and seperate them with commas.

#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

global ignored := { "explorer.exe":0, "firefox.exe":0, "discord.exe":0 }

ProcKill()
{
	procname := "-"
	WinGet, procname, ProcessName, A
	StringLower, procname, procname
	if(ignored.HasKey(procname) = false)
	{
		Runwait, taskkill /im %procname% /f,, Hide
	}
}

#End::ProcKill()