#!/bin/bash

echo "
[mysvit]
   comment = My Svit Share
   path = /mysvit
   browseable = yes
   read only = no
   guest ok = no
   valid users = sv" >> /etc/samba/smb.conf

smbpasswd -a sv
