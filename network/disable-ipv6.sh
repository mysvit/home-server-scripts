#!/usr/bin/bash
f="/etc/sysctl.d/70-disable-ipv6.conf"
clear
echo "net.ipv6.conf.all.disable_ipv6 = 1" > $f
sysctl -p -f /etc/sysctl.d/70-disable-ipv6.conf
echo $f

