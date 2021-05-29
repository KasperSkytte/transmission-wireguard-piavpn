#!/usr/bin/env bash
mkdir -p volumes/config/custom-cont-init.d \
  volumes/watch \
  volumes/downloads
touch volumes/config/wg0.conf
cp manual-connections/*.sh \
  manual-connections/ca.rsa.4096.crt \
  -t volumes/config/
cat << 'initscript' > volumes/config/custom-cont-init.d/init.sh
#!/usr/bin/env bash
cd /config
./get_token.sh
./get_region.sh
initscript
chmod +x volumes/config/*.sh
