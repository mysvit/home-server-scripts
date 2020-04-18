#!/bin/bash
# mount usb on startup
clear
FSTAB="/etc/fstab"
fdisk -l

echo
echo "Enter device what you want to mount [/dev/sdc for example] : "
read MOUNT_DEVICE
[ -z ${MOUNT_DEVICE} ] && echo "Please provide mount device." && exit

echo "Enter mount path [/mnt/usb for example] : "
read MOUNT_PATH
[ -z ${MOUNT_PATH} ] && echo "Please provide mount path." && exit

echo "mount $MOUNT_DEVICE $MOUNT_PATH" >> $FSTAB
nano $FSTAB
