@echo off
set /p URL=URL:
yt-dlp --ignore-errors --write-sub --write-auto-sub --add-metadata --write-info-json --write-description --write-annotation --write-thumbnail --yes-playlist --format bestvideo[ext=webm]+bestaudio[ext=webm]/bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=webm]/best[ext=mp4]/bestvideo+bestaudio/best --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(title).100s/%%(title).100s - (%%(resolution)s).%%(ext)s" -- %URL%
pause