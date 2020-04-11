#!/bin/bash
# mount Samba on startup

echo "Startup mount samba share : "
read
echo "//192.168.1.1/remoteSambaFolder /mnt/mountFolder cifs username=[username],password=[password],vers=1.0,uid=nobody,iocharset=utf8,noperm 0 0" >> $f
nano $f
