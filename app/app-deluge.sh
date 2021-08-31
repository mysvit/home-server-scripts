#!/bin/bash

# config located /home/deluge/.config/core.conf
#sed  -i 's/"move_completed_path".*/"move_completed_path":"test"/' /home/home-server/core.conf

#open deluge web your-server-ip:8112
# default password = deluge
# change password, download folder and compleader folder

apt install deluged deluge-web -y
adduser --system --group deluge

deluged_service="/etc/systemd/system/deluged.service"
echo "[Unit]
Description=Deluge Bittorrent Client Daemon
After=network-online.target
[Service]
Type=simple
User=deluge
Group=deluge
UMask=022
ExecStart=/usr/bin/deluged -d
Restart=on-failure
TimeoutStopSec=2000
[Install]
WantedBy=multi-user.target" > $deluged_service

systemctl enable deluged
systemctl start deluged


deluge_web_service="/etc/systemd/system/deluge-web.service"
echo "
[Unit]
Description=Deluge Bittorrent Client Web Interface
Documentation=man:deluge-web
After=network-online.target deluged.service
Wants=deluged.service
[Service]
Type=simple
UMask=027
ExecStart=/usr/bin/deluge-web -d
Restart=on-failure
[Install]
WantedBy=multi-user.target
" > $deluge_web_service

systemctl enable deluge-web
systemctl start deluge-web

systemctl status deluged -l --no-pager
systemctl status deluge-web -l --no-pager
