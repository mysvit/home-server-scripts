#!/usr/bin/env bash
apt install curl dirmngr apt-transport-https lsb-release ca-certificates -y
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install nodejs -y
npm install cloudcmd -g

echo -n "enter username : "
read my_user
echo -n "enter password : "
read my_pwd
cloudcmd --username $my_user --password $my_pwd --auth --save --no-server

srv="/etc/systemd/system/cloudcmd.service"
echo "[Unit]" >> $srv
echo "Description=Cloud Commander" >> $srv
echo "After=network-online.target" >> $srv
echo "[Service]" >> $srv
echo "Type=simple" >> $srv
echo "ExecStart=/usr/bin/cloudcmd" >> $srv
echo "Restart=on-failure" >> $srv
echo "[Install]" >> $srv
echo "WantedBy=multi-user.target" >> $srv

systemctl enable cloudcmd
systemctl start cloudcmd
