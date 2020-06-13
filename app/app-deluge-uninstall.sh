#!/bin/bash

systemctl stop deluged
systemctl disable deluged
apt remove -y deluged
apt purge -y deluged
rm "/etc/systemd/system/deluged.service"

systemctl stop deluge-web
systemctl disable deluge-web
apt remove -y deluge-webui
apt purge -y deluge-webui
rm "/etc/systemd/system/deluge-web.service"

deluser deluge
delgroup deluge
rm -r /home/deluge
