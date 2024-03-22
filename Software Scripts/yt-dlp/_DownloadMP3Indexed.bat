@echo off
set /p URL=URL: 
start _DownloadMP3Indexed.bat
yt-dlp --ignore-errors --yes-playlist --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(playlist)s/%%(playlist_index)s - %%(title).100s.%%(ext)s" -- %URL%
exit