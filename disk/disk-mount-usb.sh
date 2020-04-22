#!/bin/bash
clear
FSTAB="/etc/fstab"
fdisk -l

echo
echo "##########  mount usb and put on startup ##########"
echo
echo -n "Enter device what you want to mount [/dev/sdb1 for example] : "
read MOUNT_DEVICE
[ -z $MOUNT_DEVICE ] && echo "Please provide mount device." && exit
MOUNT_ID=$(blkid $MOUNT_DEVICE | awk -F'"' '{print $2}')
echo "Your USB ID is $MOUNT_ID"

echo -n "Enter mount path [/mnt/usb for example] : "
read MOUNT_PATH
[ -z $MOUNT_PATH ] && echo "Please provide mount path." && exit
if [ ! -d $MOUNT_PATH ]
then
  echo -n "Directory $MOUNT_PATH DOES NOT exists. Do you want to create it [Y/n] : " 
  read YES_NO
  [ -z $YES_NO ] || [ "$YES_NO" = "n" ] || [ "$YES_NO" = "N" ] && echo "Answer no! Script canceled!" && exit
  mkdir $MOUNT_PATH
fi

set -e -x -o pipefail
mount $MOUNT_DEVICE $MOUNT_PATH

echo "# [Description for your USB]  $MOUNT_DEVICE" >> $FSTAB
echo "UUID=$MOUNT_ID $MOUNT_PATH auto nosuid,nodev,nofail 0 0" >> $FSTAB
nano $FSTAB
