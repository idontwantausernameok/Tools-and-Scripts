@echo off
set /p URL=URL: 
start DownloadMP3Indexed.bat
youtube-dl --ignore-errors --write-sub --write-auto-sub --yes-playlist --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(playlist)s/#%%(playlist_index)s - %%(title)s.%%(ext)s" -- %URL%
exit