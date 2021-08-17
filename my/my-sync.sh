#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt" >> "${MYSVIT_LOG}/sync.log"
echo "rsync -arv ${MOUNT_PATH_8T_1}/ ${MOUNT_PATH_16T_4}${MOUNT_NAME_8T_1}/" >> "${MYSVIT_LOG}/sync.log"
echo "rsync -arv ${MOUNT_PATH_8T_3}/ ${MOUNT_PATH_16T_4}${MOUNT_NAME_8T_3}/" >> "${MYSVIT_LOG}/sync.log"

chown -R jellyfin:jellyfin "${MOUNT_PATH_8T_1}"
chown -R jellyfin:jellyfin "${MOUNT_PATH_8T_3}"
chown -R jellyfin:jellyfin "${MOUNT_PATH_16T_4}"
find "${MOUNT_PATH_8T_1}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
find "${MOUNT_PATH_8T_3}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
find "${MOUNT_PATH_16T_4}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

rsync -arv --delete-before "${MOUNT_PATH_8T_1}/" "${MOUNT_PATH_16T_4}${MOUNT_NAME_8T_1}/" >> "${MYSVIT_LOG}/sync.log"
rsync -arv --delete-before "${MOUNT_PATH_8T_3}/" "${MOUNT_PATH_16T_4}${MOUNT_NAME_8T_3}/" >> "${MYSVIT_LOG}/sync.log"
rsync -arv --delete-before "${MYSVIT_WEB}/" "${MOUNT_PATH_16T_4}/web/" >> "${MYSVIT_LOG}/sync.log"
rsync -arv --delete-before "${MYSVIT_SYNC}/" "${MOUNT_PATH_16T_4}/sync/" >> "${MYSVIT_LOG}/sync.log"
rsync -arv --delete-before "${MYSVIT_DELUGE_COMPLEATED}/" "${MOUNT_PATH_16T_4}/deluge_compl/" >> "${MYSVIT_LOG}/sync.log"

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "END $dt" >> "${MYSVIT_LOG}/sync.log"
