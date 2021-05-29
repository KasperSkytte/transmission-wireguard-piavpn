# transmission_pia
Docker container combining transmission and Private Internet Access VPN, based on linuxserver.io/transmission

## Usage
Set your PIA credentials by creating a file `.env` by setting the following variables:

```
PIA_USER=xxxxx
PIA_PASS=yyyyy
```

Then run `prepare.sh` (which simply creates scripts in `volumes/config`) and afterwards `docker-compose up -d` and you should be connected.