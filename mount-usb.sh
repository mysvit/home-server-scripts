#!/bin/bash


# startup mount  usb
srv="/etc/fstab"
echo "mount /dev/sdc1 /mnt/media" >> $srv

# startup mount samba share
echo "//192.168.1.1/MEDIA/media /mnt/media cifs username=[username],password=[password],vers=1.0,uid=nobody,iocharset=utf8,noperm 0 0
">>$srv
