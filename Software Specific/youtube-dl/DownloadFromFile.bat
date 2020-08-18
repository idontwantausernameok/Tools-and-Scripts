@echo off
set /p TXTFILE=TXTFILE:
set /p FOLDERNAME=FOLDERNAME:
youtube-dl --ignore-errors --format bestvideo[ext=webm]+bestaudio[ext=webm]/bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=webm]/best[ext=mp4]/bestvideo+bestaudio/best --output "C:/%%HOMEPATH%%/Desktop/Downloads/%FOLDERNAME%/%%(title)s - (%%(resolution)s).%%(ext)s" --batch-file %TXTFILE%
exit