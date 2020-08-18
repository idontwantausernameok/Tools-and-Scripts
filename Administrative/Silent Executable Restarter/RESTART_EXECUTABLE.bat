@echo off
:start
tasklist /nh /fi "imagename eq EXECUTABLE_NAME.exe" | find /i "EXECUTABLE_NAME.exe" >nul && (
rem
) || (
echo Server start %time%
start EXECUTABLE_NAME.exe
)
ping -n 3 127.0.0.1 > nul
goto start