param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

Write-Output "File: $FilePath"

# Extract the extension (including the dot)
$extension = [System.IO.Path]::GetExtension($FilePath)
Write-Output "Extension: $extension"

# Extract the filename without extension
$filename = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
Write-Output "File Name: $filename"

Write-Output "Transcoding all audio channels to Vorbis..."
# Build output filename with "VORBIS_" prefix
$outputFile = "VORBIS_${filename}${extension}"

# Run ffmpeg command
ffmpeg -i $FilePath -map 0 -c copy -c:a libvorbis $outputFile