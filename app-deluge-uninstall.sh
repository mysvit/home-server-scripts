!/bin/bash

systemctl stop deluged
systemctl disable deluged
deluged_service="/etc/systemd/system/deluged.service"

systemctl stop deluge-web
systemctl disable deluge-web
deluge_web_service="/etc/systemd/system/deluge-web.service"

apt remove deluged -y
apt remove deluge-webui -y
deluser deluge

rm $deluged_service
rm $deluge_web_service
