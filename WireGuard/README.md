Place `next-ip.txt` and `wg-add-client.sh` in your `$HOME/wireguard` directory.
Your Wireguard config is assumed to be `wg0.conf` located in `/etc/wireguard/`.
There are some block and allow configurations inside the example `wg0.conf` file, use them to create and adjust your own.

Make sure you have the following folders:
`$HOME/wireguard`
`$HOME/wireguard/clients`

Script usage: `./wg-add-client.sh {client-profile-name}`.

IP addresses are assigned from the `next-ip.txt` file, they increment each time the script runs.

You might want to edit a Client by adding their local network to `AllowedIPs`.
Example: `AllowedIPs = 0.0.0.0/0, 192.168.41.0/24`.

Good luck.