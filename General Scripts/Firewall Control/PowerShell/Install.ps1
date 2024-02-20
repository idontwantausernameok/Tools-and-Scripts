#$wid=[System.Security.Principal.WindowsIdentity]::GetCurrent()
#$prp=new-object System.Security.Principal.WindowsPrincipal($wid)
#$adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
#$elevated=$prp.IsInRole($adm)


#if ($elevated -eq $false)
#{
#	Write-Host('Not elevated, elevating...')
#	Set-ExecutionPolicy RemoteSigned
#	elevate Invoke-Expression .\Install.ps1
#}


#Write-Host('Elevated!')

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
	exit
}

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$ruleName = "";
$pathToExe = "";

$ruleName = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the name of your Firewall Rule:', 'Rule Name')
$pathToExe = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the path of the executable:', 'Path to Exe')
New-NetFirewallRule -Direction Outbound -Action Block -Program $pathToExe -DisplayName ($ruleName + " Outbound")
New-NetFirewallRule -Direction Inbound -Action Block -Program $pathToExe -DisplayName ($ruleName + " Inbound")

#Variables for Inbound and Outbound connections
$outbound = ' -DisplayName ("' + $ruleName + ' Outbound")'
$inbound = ' -DisplayName ("' + $ruleName + ' Inbound")'
#Script to check for admin rights
$adminCheck = "if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
	Start-Process powershell.exe -windowstyle hidden `"-NoProfile -ExecutionPolicy Bypass -File ```"`$PSCommandPath```"`" -Verb RunAs;
	exit
}
"

#BakeText for Toggling the Firewall Rules
$bakeText = $adminCheck + "`$ruleStatus = (Get-NetFirewallRule" + $outbound + ").Enabled 
If (`$ruleStatus -eq `$true)
{
    Write-Host('Disabling...')
	Disable-NetFirewallRule" + $outbound + "
	Disable-NetFirewallRule" + $inbound + "
}
else
{
    Write-Host('Enabling...')
	Enable-NetFirewallRule" + $outbound + "
	Enable-NetFirewallRule" + $inbound + "
}"

# Create Toggle Script:
$toggleRulesPath = ((Split-Path -Path $PSCommandPath -Resolve) + '\Toggle_Rules_For_' + $ruleName + '.ps1')
$bakeText | Set-Content ($toggleRulesPath)

#BakeText for Removing the Rules
$bakeText = $adminCheck + "Remove-NetFirewallRule" + $outbound + "
Remove-NetFirewallRule" + $inbound

# Create Remove Script:
$removeRulesPath = ((Split-Path -Path $PSCommandPath -Resolve) + '\Remove_Rules_For_' + $ruleName + '.ps1')
$bakeText | Set-Content ($removeRulesPath)

# Create Shortcuts
$AppLocation = $toggleRulesPath
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut((Split-Path -Path $PSCommandPath -Resolve) + '\Toggle_' + $ruleName + '.lnk')
$Shortcut.TargetPath = "`"C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe`""
$Shortcut.Arguments ="-windowstyle hidden -NoProfile -ExecutionPolicy Bypass -File `"$AppLocation`" -Verb RunAs"
$Shortcut.Save()

#G:\Steam\steamapps\common\PlanetSide 2\PlanetSide2_x64.exe