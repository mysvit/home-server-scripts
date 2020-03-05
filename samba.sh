#!/usr/bin/env bash

# add user 
# smbpasswd -a [username]

# see samba user
# pdbedit -w -L

# systemctl restart smbd

apt update
apt install samba -y

#workgroup = MEDIA-WORLD
#[work]
#comment = work
#read only = no
#path = /home
#guest ok = no
