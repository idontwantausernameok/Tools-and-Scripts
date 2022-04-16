@echo off

echo Full backup report for:
echo %DATE%
echo %TIME%
echo ________________________________________________________________________________

robocopy "D:\Media\Music" "\\ARCHIVALUDUM\Media\Music" * /E /PURGE /NDL /NP

pause