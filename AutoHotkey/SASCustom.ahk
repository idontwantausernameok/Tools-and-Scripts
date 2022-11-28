#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

~LAlt::LeftAlt()
LeftAlt()
{
	if (A_PriorHotkey != "~LAlt" or A_TimeSincePriorHotkey > 500)
	{
		KeyWait, LAlt
		return
	}
	Send {F23}
	return
}

~RAlt::RightAlt()
RightAlt()
{
	if (A_PriorHotkey != "~RAlt" or A_TimeSincePriorHotkey > 500)
	{
		KeyWait, RAlt 
		return
	}
	Send {F24}
	return
}

^!Space::Send {Media_Play_Pause}


F13::LMBSpam()
LMBSpam()
{
	while (GetKeyState("F13","P"))
	{
		Click
		Sleep, 20
	}
}

F14::RMBSpam()
RMBSpam()
{
	while (GetKeyState("F14","P"))
	{
		Click, Right
		Sleep, 20
	}
}