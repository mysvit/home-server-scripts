#!/usr/bin/bash
clear
f="/etc/network/interfaces"

myInterface="
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#Static network
allow-hotplug enp0s1
iface $intStat inet static
address 192.168.1.10
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1 8.8.8.8"


echo "###################################################################"
echo "List all interfaces : "
ip link show
echo
echo "####### Current file contains #####################################"
cat $f
echo
echo "###################################################################"
echo "####### Netx lines will replace $f #########"
echo "$myInterface"
echo "###################################################################"
echo
echo -n "Do you want to add this to $f Y/n : "
read yesNo

if [ "$yesNo" == "Y" ] || [ "$yesNo" == "y"  ]
then
  echo "$myInterface" > $f
  nano $f
  bash network-restart.sh
else
  nano $f
fi
