#!/usr/bin/bash
clear
f-interface="/etc/network/interfaces"
f-hostname="/etc/hostname"

myHostname="media"
myInterface="
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#Static network
allow-hotplug enp0s8
iface enp0s8 inet static
address 192.168.1.10
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1 8.8.8.8"


echo "###################################################################"
echo "List all interfaces : "
ip link show
echo
echo "####### Current file [$f-interface] contains ###########"
cat $f-interface
echo
echo "###################################################################"
echo "####### Netx lines will replace $f-interface ###########"
echo "$myInterface"
echo "###################################################################"
echo
echo "######## Hostname will be [media] #################################"
echo -n "Do you want to add this to $f-interface Y/n : "
read yesNo

if [ "$yesNo" == "Y" ] || [ "$yesNo" == "y"  ]
then
  echo "$myHostname" > $f-hostname
  echo "$myInterface" > $f-interface
  nano $f-interface
  bash network-restart.sh
else
  nano $f-interface
fi
