#!/usr/bin/env bash

#LOCATION your-server-ip:8000
#editor doesn't works


apt install curl dirmngr apt-transport-https lsb-release ca-certificates -y
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install nodejs -y
npm install cloudcmd -g

echo -n "enter username : "
read my_user
echo -n "enter password : "
read my_pwd
cloudcmd --username $my_user --password $my_pwd --auth --save --no-server

adduser --system --group cloudcmd

srv="/etc/systemd/system/cloudcmd.service"
echo "[Unit]" >> $srv
echo "Description=Cloud Commander" >> $srv
echo "After=network-online.target" >> $srv
echo "[Service]" >> $srv
echo "Type=simple" >> $srv
echo "User=cloudcmd">>$srv
echo "Group=cloudcmd">>$srv
echo "UMask=022">>$srv
echo "ExecStart=/usr/bin/cloudcmd" >> $srv
echo "Restart=on-failure" >> $srv
echo "[Install]" >> $srv
echo "WantedBy=multi-user.target" >> $srv

systemctl enable cloudcmd
systemctl start cloudcmd
