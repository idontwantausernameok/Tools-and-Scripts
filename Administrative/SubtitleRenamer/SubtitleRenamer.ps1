$startDir = (Get-Item .).FullName

foreach ($folder in Get-ChildItem -Directory -Recurse)
{
    foreach ($file in Get-ChildItem -File -LiteralPath $folder.FullName)
    {
        $extn = [IO.Path]::GetExtension($file.FullName)
        if ($extn -eq ".srt" )
        {
            $newFileName=$folder.Name + $extn
            $fname = $file.Name
            Rename-Item -LiteralPath $file.FullName -NewName $newFileName
            echo "    $fname ==> $newFileName"
			$newFullPath =  $folder.FullName
			$newFullPath += "\$newFileName"
			Copy-Item $newFullPath -Destination $startDir
            break
        }
    }
}
