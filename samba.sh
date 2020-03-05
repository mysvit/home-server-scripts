#!/usr/bin/env bash

apt update
apt install samba -y

#workgroup = MEDIA-WORLD
#[work]
#comment = work
#read only = no
#path = /home
#guest ok = no

# add user 
# smbpasswd -a [username]
systemctl restart smbd
