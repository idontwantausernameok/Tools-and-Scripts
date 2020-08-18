@echo off
set /p URL=URL: 
start DownloadMP3.bat
youtube-dl --ignore-errors --write-sub --write-auto-sub --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(title)s.%%(ext)s" -- %URL%
exit