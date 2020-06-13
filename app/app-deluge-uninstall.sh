#!/bin/bash

systemctl stop deluged
systemctl disable deluged
apt remove deluged -y
rm "/etc/systemd/system/deluged.service"

systemctl stop deluge-web
systemctl disable deluge-web
apt remove deluge-webui -y
rm "/etc/systemd/system/deluge-web.service"

deluser deluge
rm -r /home/deluge
