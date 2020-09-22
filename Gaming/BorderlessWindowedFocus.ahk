;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The shortcut is set to WinKey + Home, see the AHK docs on how to change it.

;This script will try to force a pseudo borderless-fullscreen mode.
;This might not work at all or instead, break mouse functionality.
;You have been warned.

#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

ResizeWindow()
{
	WinGet, WindowID, ID, A
	WinSet, Style, -0xC40000, ahk_id %WindowID%
	WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
}


#Home::ResizeWindow()