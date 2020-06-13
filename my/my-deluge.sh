#!/bin/bash
source ./my/my-config.sh

# install deluge
bash ./app/app-deluge.sh

echo ""
echo "***********************************  restore from backup **********************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

bash ./my/my-deluge-restore.sh

echo ""
echo "************************************ configure backup *************************************************"
echo ""

chown -R deluge:deluge "${MYSVIT_BACKUP}/deluge"
find "${MYSVIT_BACKUP}/deluge" -type d -exec chmod 755 {} \;
find "${MYSVIT_BACKUP}/deluge" -type f -exec chmod 655 {} \;

# add backup config to crontab
echo "0 1 * * * /bin/sh /home/home-server-scripts/my/my-deluge-backup.sh" > "${CRONTAB_DIR}\deluge"

