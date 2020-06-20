#!/bin/bash
clear

echo -n "Enter path for share : "
read sharePath
echo -n "Enter user name for share : "
read shareUser

if [[ -z "$sharePath"] || [ -z "$shareUser"]]
then
  nano /etc/samba/smb.conf
else
  smbpasswd -a $shareUser
  echo "[mysvit]
   comment = My Svit Share
   path = $sharePath
   browseable = yes
   read only = no
   guest ok = no
   valid users = $shareUser
" >> /etc/samba/smb.conf

  nano /etc/samba/smb.conf
  
  systemctl restart smbd
fi
