;This is an AutoHotkey 2 (AHK2) Script.
;It requires you to install AHK2 to use it.
;I will not distribute compiled versions.

;It runs automatically.

;This script will try to force a pseudo borderless-fullscreen mode.
;This might not work at all or instead, break mouse functionality.
;You have been warned.

#Requires AutoHotkey v2.0
;#Usehook
#Warn
#Warn VarUnset, Off
#SingleInstance
SendMode("Input")
SetWorkingDir(A_ScriptDir)
KeyHistory(0)

global locked_ID

loop
{
    WindowID := WinActive("Mafia III: Definitive Edition")
    if (WindowID != 0)
    {
        locked_ID := WindowID
        Style := WinGetStyle(WindowID)
        if (Style & -0xC40000)
        {
            WinSetStyle("-0xC40000", WindowID)
            WinMove(0, 0, A_ScreenWidth, A_ScreenHeight, WindowID)
            SetTimer(lock_engage, 5)
        }
    }
    else
    {
        SetTimer(lock_engage, 0)
		ClipCursor(False,0,0,0,0)
    }
    sleep 100
}

lock_engage() {
    WinGetPos(&VarX, &VarY, &Width, &Height, "ahk_id " locked_ID)
    VarX2 := VarX + Width
    VarY2 := VarY + Height
    ClipCursor(True, VarX, VarY, VarX2, VarY2)
}

ClipCursor(Confine:=True, x1:=0, y1:=0, x2:=1, y2:=1) {
	local R := 0
	if confine {
		R := Buffer(16)
		NumPut("int", x1, R)
		NumPut("int", y1, R, 4)
		NumPut("int", x2, R, 8)
		NumPut("int", y2, R, 12)
	}
	Return DllCall("ClipCursor", "Ptr", R)
}