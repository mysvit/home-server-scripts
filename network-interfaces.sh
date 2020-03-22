#!/usr/bin/bash

echo "List all interfaces"
ip link show

echo
echo -n "Enter interface what you want add like static or press ENTER to see interfaces : "
read intStat

if [ ! -z "$intStat" ]
then

f="/etc/network/interfaces"
echo "#Static network"                >>$f
echo "#allow-hotplug $intStat"        >>$f
echo "#iface $intStat inet static"    >>$f
echo "#address 192.168.1.10"          >>$f
echo "#netmask 255.255.255.0"         >>$f
echo "#gateway 192.168.1.1"           >>$f
echo "#dns-nameservers 192.168.1.1"   >>$f

  nano $f

  bash network-restart.sh

else

  nano $f

fi


