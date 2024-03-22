foreach ($file in Get-ChildItem -File)
{
    $name = $file.Name
    $extn = [IO.Path]::GetExtension($file.FullName)
    $folderName=$name.Replace($extn, "")
    echo $folder
    $folder=New-Item -Path . -Name "$folderName" -ItemType "directory" -Force
    Move-Item $file $folder
}