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
	if (A_PriorHotkey != "~LAlt" or A_TimeSincePriorHotkey > 300)
	{
		KeyWait("LAlt")
		return
	}
	Send("{F23}")
	return
}

~RAlt::RightAlt()
RightAlt()
{
	if (A_PriorHotkey != "~RAlt" or A_TimeSincePriorHotkey > 300)
	{
		KeyWait("RAlt")
		return
	}
	Send("{F24}")
	return
}

^!Space::Send("{Media_Play_Pause}")

*F13::LMBSpam()
LMBSpam()
{
	while (GetKeyState("F13","P"))
	{
		Click("Left")
		Sleep(30)
	}
}

*F14::RMBSpam()
RMBSpam()
{
	while (GetKeyState("F14","P"))
	{
		Click("Right")
		Sleep(30)
	}
}

^!CtrlBreak::AudioRestart()
AudioRestart()
{
	Default := ProcessExist("Discord.exe") > 0
	PTB := ProcessExist("DiscordPTB.exe") > 0
	Canary := ProcessExist("DiscordCanary.exe") > 0

	ProcessCloseAll("voicemeeter8x64.exe")
	ProcessCloseAll("Discord.exe")
	ProcessCloseAll("DiscordPTB.exe")
	ProcessCloseAll("DiscordCanary.exe")

	Sleep(50)
	Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeter8x64.exe")
	Sleep(2000)

	localApps:="C:\Users\" . A_UserName . "\AppData\Local"
	if (Default == 1)
	{
		start := localApps . "\Discord\Update.exe --processStart Discord.exe"
		Run(start)
	}
	
	if (PTB == 1)
	{
		start :=  localApps . "\DiscordPTB\Update.exe --processStart DiscordPTB.exe"
		Run(start)
	}
	
	if (Canary == 1)
	{
		start :=  localApps . "\DiscordCanary\Update.exe --processStart DiscordCanary.exe"
		Run(start)
	}
}

ProcessCloseAll(PIDOrName)
{
    While ProcessExist(PIDOrName)
	{
        ProcessClose(PIDOrName)
	}
}

; F1::F13
; F2::F14
; F3::F15
; F4::F16
; F5::F17
; F6::F18
; F7::F19
; F8::F20
; F9::F21
; F10::F22
; F11::F23
; F12::F24