;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + Home, see the AHK docs on how to change it.

;This script will try to force a pseudo borderless-fullscreen mode.
;This might not work at all or instead, break mouse functionality.
;You have been warned.
;Put the game's window title in double quotes and seperate them with commas.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

WindowTitles := ["Underrail"]

#Home::ResizeAllWindows(WindowTitles)
ResizeAllWindows(arr)
{
	for index, element in arr
	{
		ResizeWindow(element)
	}
}

ResizeWindow(windowTitle)
{
	WindowID := WinGetID(windowTitle)
	if(WindowID)
	{
		WinSetStyle("-0xC00000", "ahk_id " WindowID)
		WinMove(-2, -2, A_ScreenWidth+4, A_ScreenHeight+4, "ahk_id " WindowID)
	}
}