#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

echo ""
echo "***********************************   disable bluetooth ***************************************"

"# disable bluetooth module to check run #lsmod
blacklist btusb
blacklist btrtl
blacklist btbcm
blacklist btintel
blacklist bluetooth
" | tee /etc/modprobe.d/bluetooth.conf

echo ""
echo "***********************************   disable bluetooth ***************************************"
echo ""

echo "Press Enter to continue..."
read
