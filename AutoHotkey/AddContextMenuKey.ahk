;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.
;This script will send a "Menu Key" aka "Shift+F10" keypress when tapping Right Alt and Right Ctrl at the same time.

#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

RCtrl & RAlt::Send +{F10}
RAlt & RCtrl::Send +{F10}