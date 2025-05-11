param(
    [Parameter(Mandatory = $true)]
    [string]$InputFile
)

Write-Output "File: $InputFile"

$extension = [System.IO.Path]::GetExtension($InputFile)
Write-Output "Extension: $extension"

# Get filename without extension
$filename = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
Write-Output "File Name: $filename"

# Get audio channels count of first audio stream using ffprobe
$channels = & ffprobe $InputFile -show_entries stream=channels -select_streams a:0 -of compact=p=0:nk=1 -v 0
$channels = $channels.Trim()
Write-Output "Audio Channels: $channels"

Write-Output "Mixing down all audio channels..."

$outputFile = "SAC_${filename}${extension}"

# Run ffmpeg to merge audio channels and keep video stream as is
& ffmpeg -i $InputFile -filter_complex "[0:a]amerge=inputs=$channels[a]" -ac 2 -map 0:v -map "[a]" -c:v copy $outputFile
