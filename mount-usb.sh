#!/bin/bash
# mount usb on startup
f="/etc/fstab"
fdisk -l

echo "Enter [/dev/sdc?] what you want to mount to [/mnt/usb?] : "
echo -n "[/dev/sdc?] : "
read usbMedia
echo 
echo -n "[/mnt/usb?]"
read usbFolder

echo "mount $usbMedia $usbFolder" >> $f
nano $f

# startup mount samba share
#echo "//192.168.1.1/MEDIA/media /mnt/media cifs username=[username],password=[password],vers=1.0,uid=nobody,iocharset=utf8,noperm 0 0
#">>$srv

