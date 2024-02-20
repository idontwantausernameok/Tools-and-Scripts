foreach ($file in Get-ChildItem -File)
{
    $newFileName=$file.Name.Replace("old","new")
    Rename-Item -LiteralPath $file.FullName -NewName $newFileName
}