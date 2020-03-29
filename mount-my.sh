#!/bin/bash
# mount usb on startup

f-fstab="/etc/fstab"
usb-hdd-8T="/dev/sdc"
mnt-media="/mnt/media"

mounMedia = "mount $usb-hdd-8T $mnt-media"

echo "List usb devices : "
fdisk -l

echo
echo "###################################################################"
echo "$mounMedia"
echo "###################################################################"
echo
echo -n "Do you want to add you custome mount Y/n : "
read yesNo

if [ "$yesNo" = "Y" ] || ["$yesNo" = "y" ]
then
  echo $mounMedia >> $f-fstab
fi

nano $f
