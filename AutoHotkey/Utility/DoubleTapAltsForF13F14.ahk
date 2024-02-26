;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.
;This script will Send("a F13 keypress when double tapping Left Alt within 500 milliseconds and F14 with Right Alt.")

;To properly set these as hotkeys inside other programs, modify every instance of ~LAlt and ~RAlt with LAlt and RAlt respectively and reload the script.
;This will disable the alt keys and make them in to only F13 and F14. Set your hotkeys now and change them back to ~LAlt and ~RAlt.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

~LAlt::LeftAlt()
LeftAlt()
{
	if (A_PriorHotkey != "~LAlt" or A_TimeSincePriorHotkey > 500)
	{
		KeyWait("LAlt")
		return
	}
	Send("{F13}")
	return
}

~RAlt::RightAlt()
RightAlt()
{
	if (A_PriorHotkey != "~RAlt" or A_TimeSincePriorHotkey > 500)
	{
		KeyWait("RAlt")
		return
	}
	Send("{F14}")
	return
}
