#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

    #NoEnv
    SendMode Input
     
    ~F8::Suspend
    ~End::ExitApp
    ~F11::Reload
     
    LCtrl & ~LButton::
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-4,6)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(0,5.3)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-5.8,5)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-6.7,4.8)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-1,5.8)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(1.5,5)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(4.8,1.5)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(4,3)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(3.5,2)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(4,1.3)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(7,1)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(5,2)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(2,2)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(2,3)
        }
        else
        break
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(0,4)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-2,4)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-3,4)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-5,4)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-6,3)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-5,4)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-6,2)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-5,1)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-5,0.5)
        }
        else
        break
     
    Loop 8
     
       If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-3,2)
        }
        else
        break
     
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(-1,4)
        }
        else
        break
     
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(1,2)
        }
        else
        break
     
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(3,4)
        }
        else
        break
     
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(8,3)
        }
        else
        break
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(6,4)
        }
        else
        break
     
    Loop 8
     
    If GetKeyState("LButton", "LCtrl") {
            Sleep, 6
            mouseXY(5,2)
        }
        else
        break
     
    Return
     
    mouseXY(x,y)
    {
    DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }