
function SteamWorkshopDownload
{
    # In the same folder as this script, create:
    #     _GAME.txt - Put a link to the steam page for the game.
    #     _MODS.txt - Links to Workshop items, for that game.
    # SteamCMD's base folder, must end with a slash!
    $steamCMDFolder = "..\";
    $steamCMD = "$steamCMDFolder" + "steamcmd.exe"
    $cmdParams = "+login anonymous ";

    $game = [regex]::match((Get-Content .\_GAME.txt),'^.*\/app\/(\d+)\/').Groups[1].Value;
    foreach($line in Get-Content .\_MODS.txt)
    {
        $workShopItemNumber = [regex]::match($line,'^.*\?id=(\d+)').Groups[1].Value;
        $cmdParams += "+workshop_download_item $game $workShopItemNumber ";
    }
    $cmdParams += "+quit";
    
    Invoke-Expression "$steamCMD $cmdParams";

    Echo "Moving items...";
    $downloadDir = "$steamCMDFolder" + "steamapps\workshop\content\*";
    $finalDir = ".\DOWNLOADS";
    Move-Item "$downloadDir" "$finalDir";
}
SteamWorkshopDownload;