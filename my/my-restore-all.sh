#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# create map directory and mount hdd
bash /home/home-server-scripts/my-mount.sh
# create directory structure
bash /home/home-server-scripts/my-folders.sh

bash /home/home-server-scripts/my-duckdns-restore.sh
echo '0 1 * * * bash -c "chmod -R 744 /home/home-server-scripts"' >> "${CRONTAB_ROOT}"
bash /home/home-server-scripts/my-caddy-restore.sh
bash /home/home-server-scripts/my-deluge-restore.sh
bash /home/home-server-scripts/my-jellyfin-restore.sh
bash /home/home-server-scripts/my-samba-restore.sh
bash /home/home-server-scripts/my-sync-cron.sh
