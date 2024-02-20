#!/bin/bash

echo "File: $1"

extension="${1##*.}"
echo "Extension: $extension"

filename=`basename "$1" $extension`
echo "File Name: $filename"

channels=`ffprobe "$1" -show_entries stream=channels -select_streams a:0 -of compact=p=0:nk=1 -v 0`
echo "Audio Channels: $channels"

echo "Mixing down all audio channels..."
ffmpeg -i "$1" -filter_complex "[0:a]amerge=inputs=$channels[a]" -ac 2 -map 0:v -map "[a]" -c:v copy "SAC_$filename$extension"
