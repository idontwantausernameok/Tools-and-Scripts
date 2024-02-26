;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + End, see the AHK docs on how to change it.

;This script will kill all processes inside the ToKillArray.
;Put the executable name in double quotes and seperate them with commas.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

global ignored := ["explorer.exe", "firefox.exe", "discord.exe"]

#End::ProcKill()
ProcKill()
{
	procname := WinGetProcessName("A")
	if(ignored.Has(StrLower(procname)) > 0)
	{
		ProcessCloseAll(procname)
	}
}

ProcessCloseAll(PIDOrName)
{
    While ProcessExist(PIDOrName)
	{
        ProcessClose(PIDOrName)
	}
}