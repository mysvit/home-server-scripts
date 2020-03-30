#!/bin/bash

# media
f-fstab="/etc/fstab"
usb-hdd-8T="/dev/sdc1"
mnt-media="/mnt/hdd-8T-1"
mounMedia = "mount $usb-hdd-8T $mnt-media"

# torrent deluge
usb-hdd-500G="/dev/sdc2"
mnt-deluge="/mnt/hdd-500G-1"
mounDeluge = "mount $usb-hdd-500G $mnt-deluge"

echo "List usb devices : "
fdisk -l

echo
echo "###################################################################"
echo "$mounMedia"
echo "$mounDeluge"
echo "###################################################################"
echo
echo -n "Do you want to add this custome mount to $f-fstab Y/n : "
read yesNo

if [ "$yesNo" = "Y" ] || ["$yesNo" = "y" ]
then
  echo $mounMedia >> $f-fstab
  echo $mounDeluge >> $f-fstab
fi

nano $f-fstab
