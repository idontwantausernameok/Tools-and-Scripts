@echo off

echo Full backup report for:
echo %DATE%
echo %TIME%
echo ________________________________________________________________________________

robocopy "D:\Projects" "Z:\Archives\D\Projects" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "E:\Backups" "Z:\Archives\E\Backups" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "G:\Game Files" "Z:\Archives\G\Game Files" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log /XD "G:\Game Files\Games\Itch.io BFRJE"

robocopy "M:\Assets" "Z:\Archives\M\Assets" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "M:\Books" "Z:\Archives\M\Books" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "M:\Images" "Z:\Archives\M\Images" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "M:\Music" "Z:\Archives\M\Music" * /E /PURGE /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

robocopy "M:\Podcasts" "Z:\Archives\M\Podcasts" * /E /PURGE /ZB /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%_PURGE.log

pause