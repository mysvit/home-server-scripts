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

echo "***********************************   disable bluetooth ***************************************"
echo ""
echo "***********************************   disable wifi      ***************************************"

echo "# disable wifi module to check run #lsmod
blacklist iwlwifi
blacklist cfg80211
" | tee /etc/modprobe.d/wifi.conf

echo ""
echo "***********************************   disable wifi      ***************************************"

echo "Press Enter to continue..."
read
