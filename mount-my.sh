#!/bin/bash
# mount usb on startup

f="/etc/fstab"
mounMedia = "mount /dev/sdc /mnt/usb"

echo "List usb devices : "
fdisk -l

echo
echo ###################################################################
echo $myInterface
echo ###################################################################
echo
echo -n "Do you want to add you custome mount Y/n : "
read yesNo

if [ "$yesNo" = "Y" || "$yesNo" = "y"  ]
then
  echo $mounMedia > $f
fi

nano $f
