#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# install sftp

echo ""
echo "***********************************  sftp  **********************************************"
echo ""

# create group
groupadd sftp_users
# create user
useradd -m -G sftp_users sftp_user
echo "sftp_user:myPass" | chpasswd

cat << EOF >> /etc/ssh/sshd_config
Match Group sftp_users
ChrootDirectory /sftp_folder
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
EOF
nano /etc/ssh/sshd_config

systemctl restart sshd
