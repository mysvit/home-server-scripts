#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# install sftp

echo ""
echo "***********************************  SFTP setup **********************************************"
echo ""

# create group
groupadd sftp_users
# create user
echo -n "Enter sftp user : "
read SFTP_USER
echo -n "Enter sftp password : "
read SFTP_PWD
useradd -m -G sftp_users $SFTP_USER
echo "$SFTP_USER:$SFTP_PWD" | chpasswd

echo "
Match Group sftp_users
ChrootDirectory /sftp_folder
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
" > /etc/ssh/sshd_config.d/sftp_access.conf

systemctl restart sshd
