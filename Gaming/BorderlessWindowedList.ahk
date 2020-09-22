;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + End, see the AHK docs on how to change it.

;This script will try to force a pseudo borderless-fullscreen mode.
;This might not work at all or instead, break mouse functionality.
;You have been warned.
;Put the game's window title in double quotes and seperate them with commas.

#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

WindowTitles := ["Underrail"]

ResizeWindow(windowTitle)
{
	WinGet, WindowID, ID, %windowTitle%
	if(WindowID)
	{
		WinSet, Style, -0xC40000, ahk_id %WindowID%
		WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
	}
}

ResizeAllWindows(arr)
{
	for index, element in arr
	{
		ResizeWindow(element)
	}
}

#Home::ResizeAllWindows(WindowTitles)