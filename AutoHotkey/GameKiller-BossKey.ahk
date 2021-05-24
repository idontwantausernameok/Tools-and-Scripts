;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + End, see the AHK docs on how to change it.

;This script will kill all processes inside the ToKillArray.
;Put the executable name in double quotes and seperate them with commas.

#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

ToKillArray := ["ModernWarfare.exe","barony.exe"]

ProcKill(procname)
{
	Runwait, taskkill /im %procname% /f,, Hide
}

KillAllProcs(arr)
{
	for index, element in arr
	{
		ProcKill(element)
	}
}

#End::KillAllProcs(ToKillArray)