#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     ;;
;;           F-Key Bindings            ;;
;;                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AppsKey & F1::F13  ; LMBSpam
AppsKey & F2::F14  ; RMBSpam
AppsKey & F3::F15
AppsKey & F4::F16
AppsKey & F5::F17
AppsKey & F6::F18
AppsKey & F7::F19
AppsKey & F8::F20
AppsKey & F9::F21  ; GPU Stats
AppsKey & F10::F22 ; Record
AppsKey & F11::F23 ; Mute Discord
AppsKey & F12::F24 ; Deafen Discord

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     ;;
;;          Simple Shortcuts           ;;
;;                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ctrl + Alt + Space = Play/Pause Media
^!Space::Send("{Media_Play_Pause}")

; Alt + NumPlus = F21
!NumpadSub::Send("{F21}")

; Alt + NumPlus = F22
!NumpadAdd::Send("{F22}")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     ;;
;;          Complec Shortcuts          ;;
;;                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F13 = LMBSpam
*F13::LMBSpam()
LMBSpam()
{
	while (GetKeyState("F13","P"))
	{
		Click("Left")
		Sleep(30)
	}
}

; F14 = RMBSpam
*F14::RMBSpam()
RMBSpam()
{
	while (GetKeyState("F14","P"))
	{
		Click("Right")
		Sleep(30)
	}
}

; Double-Tap LeftAlt to Mute Discord
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

; Double-Tap RightAlt to Deafen Discord
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     ;;
;;        Automation Shortcuts~        ;;
;;                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ctrl + Alt + Pause/Break = Restart Voicemeeter Potato and Discord
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

	Sleep(500)
	Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeter8x64.exe")
	Sleep(7000)
	ProcessSetPriority("Realtime", "voicemeeter8x64.exe")

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