#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

apt install rsync -y

echo ""
echo "***********************************  sync  **********************************************"
echo ""

rsync -arv "${MOUNT_PATH_16T_4}/web/" "${MYSVIT_WEB}/"
rsync -arv "${MOUNT_PATH_16T_4}/sync/" "${MYSVIT_SYNC}/"
rsync -arv "${MOUNT_PATH_16T_4}/deluge_compl/" "${MYSVIT_DELUGE_COMPLEATED}/"

if [ ! -d ${MYSVIT_LOG} ]
then
  mkdir ${MYSVIT_LOG}
fi

# add sync to crontab
echo "add sync to crontab"

echo "0 3 * * * bash -c 'source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-sync.sh'" >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************  rsync restore completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
