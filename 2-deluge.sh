#!/usr/bin/env bash
#open deluge web your-server-ip:8112
# default password = deluge
# change password, download folder and compleader folder

apt install deluged deluge-webui -y
adduser --no-create-home --system --group deluge

srv="/etc/systemd/system/deluged.service"
echo "[Unit]">>$srv
echo "Description=Deluge Bittorrent Client Daemon">>$srv
echo "After=network-online.target">>$srv
echo "[Service]">>$srv
echo "Type=simple">>$srv
echo "User=deluge">>$srv
echo "Group=deluge">>$srv
echo "UMask=022">>$srv
echo "ExecStart=/usr/bin/deluged -d">>$srv
echo "Restart=on-failure">>$srv
echo "TimeoutStopSec=300">>$srv
echo "[Install]">>$srv
echo "WantedBy=multi-user.target">>$srv

systemctl enable deluged
systemctl start deluged


srv="/etc/systemd/system/deluge-web.service"
echo "[Unit]">>$srv
echo "Description=Deluge Bittorrent Client Web Interface">>$srv
echo "After=network-online.target">>$srv
echo "[Service]">>$srv
echo "Type=simple">>$srv
echo "User=deluge">>$srv
echo "Group=deluge">>$srv
echo "UMask=027">>$srv
echo "ExecStart=/usr/bin/deluge-web">>$srv
echo "Restart=on-failure">>$srv
echo "[Install]">>$srv
echo "WantedBy=multi-user.target">>$srv

systemctl enable deluge-web
systemctl start deluge-web
