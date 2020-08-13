#!/bin/bash
source ./my/my-config.sh

# install deluge
bash ./app/app-samba.sh

echo ""
echo "***********************************  restore from backup **********************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

bash ./my/my-samba-restore.sh

echo ""
echo "************************************ configure backup *************************************************"
echo ""

# add backup config to crontab
echo "0 1 * * * /bin/sh /home/home-server-scripts/my/my-samba-backup.sh" >> "${CRONTAB_ROOT}"
