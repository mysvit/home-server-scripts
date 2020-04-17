#!/bin/bash
# mount usb on startup
f="/etc/fstab"
fdisk -l

mountLine = "mount /dev/sdc /mnt/usb"

echo "Enter [/dev/sdc?] what you want to mount to [/mnt/usb?] : "
read $mountLine

echo $mountLine >> $f
nano $f
