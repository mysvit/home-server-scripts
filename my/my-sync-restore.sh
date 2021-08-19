#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

apt install rsync -y

echo ""
echo "***********************************  sync  **********************************************"
echo ""

rsync -arv "${MOUNT_PATH_16T_4}/web/" "${MYSVIT_WEB}/"
rsync -arv "${MOUNT_PATH_16T_4}/sync/" "${MYSVIT_SYNC}/"
rsync -arv "${MOUNT_PATH_16T_4}/deluge_compl/" "${MYSVIT_DELUGE_COMPLEATED}/"

chown -R jellyfin:jellyfin ${MYSVIT_SYNC}
find "${MYSVIT_MEDIA}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)


if [ ! -d ${MYSVIT_LOG} ]
then
  mkdir ${MYSVIT_LOG}
fi

# add sync to crontab
echo "add sync to crontab"

echo "0 3 * * * bash -c 'source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-sync.sh'" >> "${CRONTAB_ROOT}"
echo '0 1 * * * bash -c "chmod -R 744 /home/home-server-scripts"' >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************  rsync restore completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
