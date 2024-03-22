@echo off
set /p URL=URL: 
start BancCampAlbums.bat
yt-dlp --ignore-errors --extract-audio --audio-format "mp3" --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(album)s/%%(track_number)s - %%(track)s.%%(ext)s" -- %URL%
exit