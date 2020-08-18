#This is for personal use, if you can make sense of it, feel free to use it.
#In short, this will recursively check all sub-folders for files and create
#text-file reports of their dates of creation and dates of modification.
#One file per folder if there are any files. Does not log folder dates.

$header = "ATTENTION! THESE ARE PRIVATE ARCHIVES! PUBLIC USE IS PROHIBITED BY LAW!`r`nThis file documents the creation and modification date of present files.`r`nLast entry on this list should be when this report was generated.`r`nThis is an automated system, for unauthorized access or problems,`r`nPlease contact the System Administrator!`r`n`r`nDATE OF CREATION:`tDATE OF MODIFICATION`tFILE:`r`n`r`n";
foreach($folder in Get-ChildItem -Directory -Recurse)
{
    $reportName = "_Archive Report.txt";
    $fullPath = $folder.FullName;
    $itemCount = (Get-ChildItem -File -Path $fullPath).count;
    Write-Host "Current Folder: $fullPath";
    Write-Host "`tItem Count: $itemCount";

    If ($itemCount -ge 1)
    {
        Test-Path "`tTesting: $fullPath\$reportName"
        If(Test-Path "$fullPath\$reportName")
        {
            Remove-Item "$fullPath\$reportName";
            Write-Host "`tOld Report Found, Removing...";
        }
        Else
        {        
            Write-Host "`tNo Old Report Found!";
        }

        New-Item -Path $fullPath -Name "$reportName" -ItemType "file" -Force -Value "$header";
        
        foreach($file in Get-ChildItem -File -Path $fullPath)
        {
            $name = $file.Name;
            $cdate = $file | Select-Object -ExpandProperty CreationTime | Get-Date -f "yyyy-MM-dd HH:mm";
            $mdate = $file | Select-Object -ExpandProperty LastWriteTime | Get-Date -f "yyyy-MM-dd HH:mm";
            Write-Host "`t`tAdding Line: $reportName $cdate`t$mdate`t`t$name`r`n"
            Add-Content "$fullPath\$reportName" "$cdate`t$mdate`t`t$name"
        }
    }

}