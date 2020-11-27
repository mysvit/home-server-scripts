#!/bin/bash
source ./my/my-config.sh

# install deluge
bash ./app/app-jellyfin.sh

echo ""
echo "***********************************  restore from backup **********************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

bash ./my/my-jellyfin-restore.sh

echo ""
echo "************************************ configure backup *************************************************"
echo ""

# add backup config to crontab
echo "0 2 * * * /bin/sh /home/home-server-scripts/my/my-jellyfin-backup.sh" >> "${CRONTAB_ROOT}"
