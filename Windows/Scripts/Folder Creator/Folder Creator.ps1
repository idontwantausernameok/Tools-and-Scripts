#This script, when run inside a folder, will get all folders inside and
#create sub-folders within each, one called Linux and another called Windows.

$folders = Get-ChildItem -Path .\
foreach ($folder in $folders)
{
    $lin = $folder.FullName + '\Linux'
    if(!(Test-Path -Path  $lin)){
        New-Item -ItemType directory -Path $lin
    }
    
    $win = $folder.FullName + '\Windows'
    if(!(Test-Path -Path  $win)){
        New-Item -ItemType directory -Path $win
    }
}
