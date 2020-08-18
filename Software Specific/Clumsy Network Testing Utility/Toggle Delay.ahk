;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;This script is meant to be used with Clumsy Network Testing Utility.
;The toggle is set to Mouse4 or 5, see the AHK docs on how to change it.
;This script will Toggle a checkbox titled "Lag" on a window called:
;"clumsy 0.2"

;This can be adapted for other programs, fairly easily.

checked := 0

ControlGet, checked, Checked, , Lag, clumsy 0.2

XButton2::
    if (checked == 1) {
        Control, Uncheck, , Lag, clumsy 0.2
        checked = 0
    }
    else
    {
        Control, Check, , Lag, clumsy 0.2
        checked = 1
    }
Return