#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

echo ""
echo "***********************************   disable bluetooth ***************************************"

echo "# disable bluetooth module to check run #lsmod
blacklist btusb
blacklist btrtl
blacklist btbcm
blacklist btintel
blacklist bluetooth
" | tee /etc/modprobe.d/bluetooth.conf

echo ""
echo "***********************************   disable wifi      ***************************************"
echo ""

echo "# disable wifi module to check run #lsmod
blacklist iwlwifi
blacklist cfg80211
" | tee /etc/modprobe.d/wifi.conf

echo ""
echo "***********************************   disable realtek   ***************************************"
echo ""

echo "# disable wifi module to check run #lsmod
blacklist r8169
blacklist mdio_devres
blacklist realtek
blacklist libphy
" | tee /etc/modprobe.d/realtek.conf

echo ""
echo "***********************************   disable ipv6      ***************************************"
echo ""

echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/70-disable-ipv6.conf
sysctl -p -f /etc/sysctl.d/70-disable-ipv6.conf

echo "Press Enter to continue..."
read
