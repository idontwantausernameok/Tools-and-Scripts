foreach ($file in Get-ChildItem -File -LiteralPath (Get-Item .).FullName)
{
	$extn = [IO.Path]::GetExtension($file.FullName);
	$filename = $file.BaseName;
	if (($extn -eq ".mkv") -or ($extn -eq ".mp4") -or ($extn -eq ".webm"))
	{
		ffmpeg -i "$file" -map 0:s:1 -c:s srt "$filename.srt"
	}
}