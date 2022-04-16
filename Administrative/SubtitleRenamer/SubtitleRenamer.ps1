foreach ($folder in Get-ChildItem -Directory -Recurse)
{
    foreach ($file in Get-ChildItem -File -LiteralPath $folder.FullName)
    {
         $extn = [IO.Path]::GetExtension($file.FullName)
        if ($extn -eq ".srt" )
        {
            $newFileName=$folder.Name + $extn
            $fname = $file.Name
            echo "    $fname ==> $newFileName"
            Rename-Item -LiteralPath $file.FullName -NewName $newFileName
            break
        }
    }
}