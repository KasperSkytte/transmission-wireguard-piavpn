#!/usr/bin/env bash
#directory with directories being mounted into containers
dir="volumes"

#make subdirectories
mkdir -p $dir/config/custom-cont-init.d \
  $dir/watch \
  $dir/downloads

#wireguard errors if conf file doesn't exist when starting
touch $dir/config/wg0.conf

#copy files from PIA manual-connections repo into /config
cp manual-connections/get_region.sh \
  manual-connections/get_token.sh \
  manual-connections/port_forwarding.sh \
  manual-connections/run_setup.sh \
  manual-connections/ca.rsa.4096.crt \
  -t $dir/config/

#adjust the launch script to write to the /config/wg0.conf file instead
#of the default /etc/wireguard/pia.conf and remove the lines that 
#start wireguard as this will be done by the container instead
sed 's/\/etc\/wireguard\/pia\.conf/\/config\/wg0\.conf/g' \
  manual-connections/connect_to_wireguard_with_token.sh |\
  head -n 145 > $dir/config/connect_to_wireguard_with_token.sh

#generate a custom launch script that runs get_token.sh and get_region.sh
cat << 'initscript' > volumes/config/custom-cont-init.d/init.sh
#!/usr/bin/env bash
cd /config
./get_token.sh
./get_region.sh
initscript
chmod -R +x volumes/config/*.sh
