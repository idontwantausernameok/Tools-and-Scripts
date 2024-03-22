@echo off

echo Full backup report for:
echo %DATE%
echo %TIME%
echo ________________________________________________________________________________

robocopy "D:\Projects" "Z:\Archives\D\Projects" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "E:\Backups" "Z:\Archives\E\Backups" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "Z:\Assets" "Z:\Archives\M\Assets" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "M:\Books" "Z:\Archives\M\Books" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "M:\Images" "Z:\Archives\M\Images" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "M:\Music" "Z:\Archives\M\Music" * /E /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

robocopy "M:\Podcasts" "Z:\Archives\M\Podcasts" * /E /ZB /NDL /NP /UNILOG+:Z:\Archives\_Logs\%DATE%.log

pause