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
	Send("{F23}")
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

*F14::SortAndEmpty()
SortAndEmpty()
{

	while (GetKeyState("F14","P"))
	{
		MouseMove(930, 425)
		Sleep(1)

		Send("{LCtrl down}")
		Sleep(1)

		Send("{MButton}")
		Sleep(1)

		Loop, 8
		{
			if(GetKeyState("F14","P"))
			{
				Send("{q}")
				Sleep(1)
				MouseMove(90, 0, 0, "R")
			}
			else {
				break
			}
		}

		Send("{LCtrl up}")
	}
}