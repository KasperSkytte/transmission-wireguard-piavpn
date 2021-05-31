# transmission-wireguard-piavpn
How to combine docker containers to use transmission and wireguard with Private Internet Access VPN. Largely inspired by https://spad.uk/wireguard-as-a-vpn-client-in-docker-using-pia/. You can also remove or replace the transmission container with anything else. 

## Installation and usage
Clone this repo recursively:
```
git clone --recursive https://github.com/KasperSkytte/transmission-wireguard-piavpn.git
cd transmission-wireguard-piavpn
```

and set your PIA user credentials in the `docker-compose.yml` file.

Then run the `prepare.sh` script (which simply generates scripts in `volumes/config`) and afterwards `docker-compose up -d` and you should be connected shortly. See the respective documentation of the individual containers at https://github.com/linuxserver/docker-transmission and https://github.com/linuxserver/docker-wireguard. You can set the download and watch folders to whereever, but the scripts in `volumes/config` are required.

Here only the two docker containers themselves are tunneled through the VPN, not the host or anything else. To tunnel all traffic from the host, remove the `ALLOWEDIPS` option from the `docker-compose.yml` file, which will then default to `0.0.0.0/0`.
