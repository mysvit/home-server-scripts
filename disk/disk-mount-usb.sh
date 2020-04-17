#!/bin/bash
# mount usb on startup
clear
FSTAB="/etc/fstab"
fdisk -l

echo "Enter device what you want to mount [/dev/sdc for example] : "
read MOUNT_DEVICE
echo "Enter mount path [/mnt/usb for example] : "
read MOUNT_PATH

echo "mount $MOUNT_DEVICE $MOUNT_PATH" >> $FSTAB
nano $FSTAB
