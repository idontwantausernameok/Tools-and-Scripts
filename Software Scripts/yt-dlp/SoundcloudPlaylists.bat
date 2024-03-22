@echo off
set /p URL=URL: 
start SoundcloudPlaylists.bat
yt-dlp --ignore-errors --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(playlist)s/%%(playlist_index)s - %%(title)s" -- %URL%
exit