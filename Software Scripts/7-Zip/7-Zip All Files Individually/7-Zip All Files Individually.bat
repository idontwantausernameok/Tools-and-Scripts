@echo off
FOR /R %%i IN (*.*.*) DO "C:\Program Files\7-Zip\7z.exe" a "%%~ni.zip" "%%i"
del "ZipAll.zip"
pause
