@echo off
set /p URL=URL: 
yt-dlp --cookies-from-browser firefox --verbose --no-check-certificate --ignore-errors --write-sub --write-auto-sub --yes-playlist --format bestvideo[ext=webm]+bestaudio[ext=webm]/bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=webm]/best[ext=mp4]/bestvideo+bestaudio/best --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(title).100s/%%(title).100s - (%%(resolution)s).%%(ext)s" -- %URL%
exit