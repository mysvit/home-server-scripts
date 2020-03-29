#!/bin/bash
# mount usb on startup
f="/etc/fstab"
fdisk -l

echo -n "Enter /dev/sdc? what you want to mount to /mnt/backup : "
read usbMedia

echo "mount $usbMedia /mnt/backup" >> $f
nano $f
