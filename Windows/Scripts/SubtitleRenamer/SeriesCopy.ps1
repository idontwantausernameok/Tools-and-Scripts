function RenameAndCopy
{
	$startDir = (Get-Item .).FullName;
	foreach ($folder in Get-ChildItem -Directory -Recurse)
	{
		foreach ($file in Get-ChildItem -File -LiteralPath $folder.FullName)
		{
			$extn = [IO.Path]::GetExtension($file.FullName);
			if ($extn -eq ".srt" )
			{
				$oldName = $file.Name;
                $nameWithoutNumber = $oldName -replace '^.*_', ".";
				$newFileName=$folder.Name + $nameWithoutNumber;
                if (Test-Path -Path $newFileName -PathType Leaf)
                {
				    $newFileName=$folder.Name + "." + $file.Name;
				    echo "    [DUPLICATE] $oldName ==> $newFileName";
				    Rename-Item -LiteralPath $file.FullName -NewName $newFileName;
                }
                else
                {
				    echo "    $oldName ==> $newFileName";
				    Rename-Item -LiteralPath $file.FullName -NewName $newFileName;
                }
				$newFullPath =  $folder.FullName;
				$newFullPath += "\$newFileName";
				Copy-Item $newFullPath -Destination $startDir;
			}
		}
	}
}
RenameAndCopy;