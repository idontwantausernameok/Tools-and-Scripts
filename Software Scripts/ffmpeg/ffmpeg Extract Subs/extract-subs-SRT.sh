#!/bin/bash

for file in *; do
	if [ -f "$file" ] && [[ "$file" =~ \.(mp4|mkv|webm)$ ]]; then
		extension="${file##*.}"
		filename="${file%.*}"
		ffmpeg -i "$file" -map 0:s:1 -c:s srt "$filename.srt"
	fi
done
