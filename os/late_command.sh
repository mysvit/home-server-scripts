#!/usr/bin/bash

echo "
allow-hotplug enp8s0
iface enp8s0 inet static
address 192.168.0.10
netmask 255.255.255.0
gateway 192.168.0.1
" > /target/etc/network/interfaces.d/realtek.conf

echo "
nameserver 192.168.0.1
nameserver 8.8.8.8
" > /target/etc/resolv.conf

#echo "
#allow-hotplug enp0s31f6
#iface enp0s31f6 inet static
#address 192.168.0.10
#netmask 255.255.255.0
#gateway 192.168.0.1
#" > /target/etc/network/interfaces.d/intel.conf
#
#echo "
#nameserver 192.168.0.1
#nameserver 8.8.8.8
#" > /target/etc/resolv.conf

echo "media"  > /target/etc/hostname

echo "
deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main
deb http://deb.debian.org/debian/ bullseye-updates main
deb-src http://deb.debian.org/debian/ bullseye-updates main
" >> /target/etc/apt/sources.list;

echo "#!/usr/bin/bash
apt update
apt install -y git
git clone https://github.com/mysvit/home-server-scripts /home/home-server-scripts
cd /home/home-server-scripts
chmod -R 744 /home/home-server-scripts
bash index.sh;
" > /target/home/get-home-server-scripts.sh
