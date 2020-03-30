#!/bin/bash

# media
f-fstab="/etc/fstab"
usb-hdd-8T-1="/dev/sdc1"
mnt-hdd-8T-1="/mnt/hdd-8T-1"
mount-8T-1 = "mount $usb-hdd-8T-1 $mnt-hdd-8T-1"

# torrent deluge
usb-hdd-500G-1="/dev/sdc2"
mnt-hdd-500G-1="/mnt/hdd-500G-1"
mount-500G-1 = "mount $usb-hdd-500G-1 $mnt-hdd-500G-1"

echo "List usb devices : "
fdisk -l

echo
echo "###################################################################"
echo "$mounMedia"
echo "$mounDeluge"
echo "###################################################################"
echo
echo -n "Do you want to add this custome mount to $f-fstab (n : just view) Y/n : "
read yesNo

if [ "$yesNo" = "Y" ] || ["$yesNo" = "y" ]
then
  mkdir $hdd-8T-1
  mkdir $hdd-500G-1
  echo $mount-8T-1 >> $f-fstab
  echo $mount-500G-1 >> $f-fstab
  nano $f-fstab
  mount -a
else 
  nano $f-fstab
fi


