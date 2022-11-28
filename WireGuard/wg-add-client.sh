#!/bin/bash

set -eu
set -o pipefail

client_name=$1
#script_dir = $(pwd)

next_ip_loc="$HOME/wireguard/next-ip.txt"
client_ip_end=$(cat "$next_ip_loc")

server_conf="/etc/wireguard/wg0.conf"
server_endpoint="wireguard.sas41.com:51820"
server_ip_range="192.168.141"
dns_servers="192.168.41.53"

psk=$(wg genpsk)
client_privkey=$(wg genkey)
client_pubkey=$(wg pubkey <<<"$client_privkey")
server_pubkey=$(cat /etc/wireguard/publickey)

client_config="[Interface]
PrivateKey = $client_privkey
Address = $server_ip_range.$client_ip_end/32
DNS = $dns_servers

[Peer]
PublicKey = $server_pubkey
PresharedKey = $psk
AllowedIPs = 0.0.0.0/0
Endpoint = $server_endpoint"

server_config_add="#Client: $1
[Peer]
AllowedIPs=$server_ip_range.$client_ip_end/32
PublicKey=$client_pubkey
PresharedKey=$psk
"
echo "$server_config_add" >> $server_conf

echo "$((client_ip_end + 1))" > $next_ip_loc

qrencode -tansiutf8 <<< "$client_config"
echo "$client_config" > "$HOME/wireguard/clients/$1.conf"
