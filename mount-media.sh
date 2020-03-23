#!/bin/bash
# mount usb on startup
f="/etc/fstab"
fdisk -l

echo -n "Enter /dev/???? what you want to mount to /mnt/media : "
read usbMedia

echo "mount $usbMedia /mnt/media" >> $f

nano $f

# startup mount samba share
#echo "//192.168.1.1/MEDIA/media /mnt/media cifs username=[username],password=[password],vers=1.0,uid=nobody,iocharset=utf8,noperm 0 0
#">>$srv

