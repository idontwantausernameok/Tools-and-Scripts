@echo off
set /p URL=URL: 
start _DownloadMP3.bat
yt-dlp --ignore-errors --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(title).100s.%%(ext)s" -- %URL%
exit