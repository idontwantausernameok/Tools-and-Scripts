#!/bin/bash

# Navigate through directories
find . -type d | while read -r dir; do
    # List all images in the directory, sorted by filename
    images=$(find "$dir" -maxdepth 1 -type f -iname "*.jpg" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.jpeg" | sort)
    # Check if there are images to process
    if [[ -n "$images" ]]; then
        # Create a PDF from the images in the directory
        convert $images "$dir.pdf"
        echo "Created PDF for $dir"
    fi
done
