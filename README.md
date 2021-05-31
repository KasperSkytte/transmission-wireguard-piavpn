# transmission-wireguard-piavpn
How to combine docker containers to use transmission and wireguard with Private Internet Access VPN.

## Usage
Set your PIA credentials by creating a file `.env` with the following variables:

```
PIA_USER=xxxxx
PIA_PASS=yyyyy
```

Then run `prepare.sh` (which simply creates scripts in `volumes/config`) and afterwards `docker-compose up -d` and you should be connected. See the respective documentation of the individual containers at https://github.com/linuxserver/docker-transmission and https://github.com/linuxserver/docker-wireguard