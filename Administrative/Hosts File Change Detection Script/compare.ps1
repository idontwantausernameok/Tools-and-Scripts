$actual = (Get-FileHash C:/Windows/system32/drivers/etc/hosts -Algorithm SHA512).Hash
$backup = (Get-FileHash C:/Users/SAS41/.HFCDT/backup -Algorithm SHA512).Hash

if($actual -ne $backup)
{
    echo "";
    echo "    ██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ ██╗
    ██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ ██║
    ██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗██║
    ██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║╚═╝
    ╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝██╗
     ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝";
    echo "";
    
    Write-Warning "PROCEED WITH CAUTION!." -WarningAction Continue;

    echo "Hosts File Corruption Detected during startup!";
    echo "Did you make changes without updating the backup?";

    echo "hosts  SHA512: $actual";
    echo "backup SHA512: $backup";

    $userConfirm = Read-Host 

}
else
{
                   
    echo "Hosts File matches backup, all is well.";

    echo "hosts  SHA512: $actual";
    echo "backup SHA512: $backup";
    $userConfirm = Read-Host
}