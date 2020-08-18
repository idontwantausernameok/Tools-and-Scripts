"Add-Type -AssemblyNamePresentationFramework

`$msgBoxInput =  [System.Windows.MessageBox]::Show('Are you sure that you want to uninstall?','Uninstall','OKCancel','Error')

if (`$msgBoxInput -eq 'Ok')
{
	Remove-NetFirewallRule
	Remove-NetFirewallRule
}
else
{
	exit
}"