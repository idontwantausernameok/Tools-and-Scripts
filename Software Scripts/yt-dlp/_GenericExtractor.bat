@echo off
set /p URL=URL: 
start _GenericExtractor.bat
yt-dlp --ignore-errors --force-generic-extractor --write-sub --write-auto-sub --yes-playlist --format bestvideo[ext=webm]+bestaudio[ext=webm]/bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=webm]/best[ext=mp4]/bestvideo+bestaudio/best --output "C:/%%HOMEPATH%%/Desktop/Downloads/%%(title).100s - (%%(resolution)s).%%(ext)s" -- %URL%
exit