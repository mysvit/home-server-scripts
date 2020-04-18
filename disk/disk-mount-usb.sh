#!/bin/bash
clear
FSTAB="/etc/fstab"
fdisk -l

echo
echo "##########  mount usb and put on startup ##########"
echo
echo -n "Enter device what you want to mount [/dev/sdc for example] : "
read MOUNT_DEVICE
[ -z $MOUNT_DEVICE ] && echo "Please provide mount device." && exit

echo -n "Enter mount path [/mnt/usb for example] : "
read MOUNT_PATH
[ -z $MOUNT_PATH ] && echo "Please provide mount path." && exit
[ ! -d $MOUNT_PATH ] && echo "Directory $MOUNT_PATH DOES NOT exists." && exit

set -e -x -o pipefail
mount $MOUNT_DEVICE $MOUNT_PATH

echo "mount $MOUNT_DEVICE $MOUNT_PATH" >> $FSTAB
nano $FSTAB
