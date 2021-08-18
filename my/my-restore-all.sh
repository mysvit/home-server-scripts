#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

#install all tools
bash /home/home-server-scripts/app/app-mc.sh
bash /home/home-server-scripts/app/app-ffmpeg.sh

# create map directory and mount hdd
bash /home/home-server-scripts/my/my-mount.sh
# create directory structure
bash /home/home-server-scripts/my/my-folders.sh
# restore data from ssd
bash /home/home-server-scripts/my/my-sync-restore.sh
# restore app
bash /home/home-server-scripts/my/my-duckdns-restore.sh
bash /home/home-server-scripts/my/my-caddy-restore.sh
bash /home/home-server-scripts/my/my-deluge-restore.sh
bash /home/home-server-scripts/my/my-jellyfin-restore.sh
bash /home/home-server-scripts/my/my-samba-restore.sh
