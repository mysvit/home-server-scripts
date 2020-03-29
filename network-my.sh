#!/usr/bin/bash
f="/etc/network/interfaces"

myInterface = "
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

#Static network
allow-hotplug enp0s1
iface $intStat inet static
address 192.168.1.10
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1"

echo "List all interfaces : "
ip link show

echo
echo ###################################################################
echo $myInterface
echo ###################################################################
echo
echo -n "Do you want to apply you custome interfaces Y/n : "
read yesNo

if [ "$yesNo" = "Y" || "$yesNo" = "y"  ]
then
  echo $myInterface > $f
  nano $f
  bash network-restart.sh
else
  nano $f
fi
