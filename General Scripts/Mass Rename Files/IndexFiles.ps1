$index = 1;
foreach ($file in Get-ChildItem -File -LiteralPath (Get-Item .).FullName)
{
    $ext = [IO.Path]::GetExtension($file.FullName);
	$filename = $file.BaseName;
    $newFileName=$file.Name.Replace($filename,"$filename ($index)")
    Rename-Item -LiteralPath $file.FullName -NewName $newFileName
    echo $newFileName
    $index = $index+1;
}