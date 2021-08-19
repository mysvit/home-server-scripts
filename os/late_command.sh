#!/usr/bin/bash

echo "
allow-hotplug enp0s31f6
iface enp0s31f6 inet static
address 192.168.1.10
netmask 255.255.255.0
gateway 192.168.1.1
" | tee /target/etc/network/interfaces.d/intel.conf

echo "
nameserver 192.168.1.1
nameserver 8.8.8.8
" | tee /target/etc/resolv.conf

echo "media"  > /target/etc/hostname

#echo "deb http://deb.debian.org/debian/ buster main"                            > /target/etc/apt/sources.list; \
#echo "deb-src http://deb.debian.org/debian/ buster main"                       >> /target/etc/apt/sources.list; \
#echo "deb http://security.debian.org/debian-security buster/updates main"      >> /target/etc/apt/sources.list; \
#echo "deb-src http://security.debian.org/debian-security buster/updates main"  >> /target/etc/apt/sources.list; \
#echo "deb http://deb.debian.org/debian/ buster-updates main"                   >> /target/etc/apt/sources.list; \
#echo "deb-src http://deb.debian.org/debian/ buster-updates main"               >> /target/etc/apt/sources.list; \

echo "#!/usr/bin/bash
apt update
apt install -y git
git clone https://github.com/mysvit/home-server-scripts /home/home-server-scripts
cd /home/home-server-scripts
chmod -R 744 /home/home-server-scripts
bash index.sh;
" | tee /target/home/get-home-server-scripts.sh
