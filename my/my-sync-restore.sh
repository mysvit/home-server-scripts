#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

cp "${MOUNT_PATH_16T_4}/web/" "${MYSVIT_WEB}/"
cp "${MOUNT_PATH_16T_4}/sync/" "${MYSVIT_SYNC}/"
cp "${MOUNT_PATH_16T_4}/deluge_compl/" "${MYSVIT_DELUGE_COMPLEATED}/"

if [ ! -d ${MYSVIT_LOG} ]
then
  mkdir ${MYSVIT_LOG}
fi

# add sync to crontab
echo "add sync to crontab"

echo "0 3 * * * bash -c 'source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-sync.sh'" >> "${CRONTAB_ROOT}"
