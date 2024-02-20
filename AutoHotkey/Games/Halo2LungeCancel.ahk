;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The toggle is set to CapsLock, see the AHK docs on how to change it.


#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

*XButton2::Lunge()
Lunge()
{
    Send, {1 down}
    Sleep, 30
    Send, {1 up}

    Sleep, 3

    Send, {r down}
    Sleep, 5
    Send, {r up}

    Sleep, 3
    
    Send {LButton down}
    Sleep, 5
    Send {LButton up}
    return
}

*XButton1::LungeJump()
LungeJump()
{
    Lunge()
    
    Send {Space down}
    Sleep, 1
    Send {Space up}
    return
}