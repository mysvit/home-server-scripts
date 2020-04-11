#!/usr/bin/bash
f="/etc/network/interfaces"

echo "List all interfaces"
echo "ip link show"

ip link show

echo
echo -n "Enter interface what you want add like static or press ENTER to see interfaces : "
read intStat

if [ ! -z "$intStat" ]
then
  echo "#Static network
  #allow-hotplug $intStat
  #iface $intStat inet static
  #address 192.168.1.10
  #netmask 255.255.255.0
  #gateway 192.168.1.1
  #dns-nameservers 192.168.1.1"   >>$f

  nano $f

  bash ./network/network-restart.sh
else
  nano $f
fi
