#!/usr/bin/bash

echo "List all interfaces"
ip link show

echo "Enter interface what you want add like static : "
read intStat

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
