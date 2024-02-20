;This is an AutoHotkey (AHK) Script.
;It requires you to install AHK to use it.
;I will not distribute compiled versions.

;The script prevents the file menu from showing up when you press Left Alt.
;It does so by simply pressing the Escape key when you release Left Alt.

#KeyHistory 0
#NoEnv
#Warn
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%

~LAlt:: return
LAlt Up:: Send, {Escape}