$CS2ServersJson = Invoke-WebRequest -Uri "https://api.steampowered.com/ISteamApps/GetSDRConfig/v1/?appid=730"
$CS2Servers = ConvertFrom-Json $([String]::new($CS2ServersJson.Content))
$TestServers = [System.Collections.ArrayList]@()

# Amsterdam (Netherlands)
foreach($relay in $CS2Servers.pops.ams.relays)
{
    $TestServers.Add($relay.ipv4)
}

# Frankfurt (Germany)
foreach($relay in $CS2Servers.pops.fra.relays)
{
    $TestServers.Add($relay.ipv4)
}

# # Helsinki (Finland)
# foreach($relay in $CS2Servers.pops.hel.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# # London (England)
# foreach($relay in $CS2Servers.pops.lhr.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# # Madrid (Spain)
# foreach($relay in $CS2Servers.pops.mad.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# # Paris (France)
# foreach($relay in $CS2Servers.pops.par.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# # Stockholm - Kista (Sweden)
# foreach($relay in $CS2Servers.pops.sto.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# # Vienna (Austria)
# foreach($relay in $CS2Servers.pops.vie.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }

# Warsaw (Poland)
foreach($relay in $CS2Servers.pops.waw.relays)
{
    $TestServers.Add($relay.ipv4)
}

# Stockholm - Bromma (Sweden)
# foreach($relay in $CS2Servers.pops.sto2.relays)
# {
#     $TestServers.Add($relay.ipv4)
# }


$TestServers.Add("steampowered.com")
$TestServers.Add("steamcommunity.com")
$TestServers.Add("discord.com")
$TestServers.Add("teams.microsoft.com")


$bytes = new-object byte[] 10000
for ($i = 0; $i -lt $bytes.Count; $i++) {
    $bytes[$i] = Get-Random -Maximum 255
}

$TestServers | ForEach-Object -Parallel {
    $buffer = $using:bytes
    filter timestamp {"$(Get-Date -Format o)	$($_.Status)!	$($_.Address)	$($_.RoundtripTime)"}
    Function New-IntervalPing {
        [Alias("iping")]
        Param(
            [string]$ComputerName,
            [int]$Count = 2147483646,
            [int]$TimeOut = 100,
            [int]$Interval = 500
        )
    
        1..$Count | ForEach-Object {
            $Ping = [System.Net.NetworkInformation.Ping]::New()
            $Ping.Send($ComputerName,$TimeOut,$buffer)
            start-sleep -Milliseconds $Interval
        }
    }
    New-IntervalPing $_ -Interval 100 | timestamp >> ".\logs\$_.log"
} -ThrottleLimit 9999 