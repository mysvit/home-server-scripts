#!/bin/bash
source ./my/my-config.sh

# install sftp

echo ""
echo "***********************************  sftp  **********************************************"
echo ""

# create group
groupadd sftp_users
# create user without login
useradd -r -s /sbin/nologin sftp_user
# add user to sftp_users group
usermod -G sftp_users sftp_user
echo "sftp_user:myPass" | chpasswd

cat << EOF >> /dev/ssh/sshd_config
Match Group sftp_users
ChrootDirectory /media
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
EOF
nano /dev/ssh/sshd_config

systemctl restart sshd
