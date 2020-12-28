#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt" >> "${MYSVIT_LOG}/sync.log"
echo "rsync -arv ${MOUNT_PATH_8T_1}/ ${MOUNT_PATH_8T_3}/ >> ${MYSVIT_LOG}/sync.log" >> "${MYSVIT_LOG}/sync.log"

chown -R jellyfin:jellyfin "${MOUNT_PATH_8T_1}"
chown -R jellyfin:jellyfin "${MOUNT_PATH_8T_3}"
find "${MOUNT_PATH_8T_1}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
find "${MOUNT_PATH_8T_3}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

rsync -arv --delete-before "${MOUNT_PATH_8T_1}/" "${MOUNT_PATH_8T_3}/" >> "${MYSVIT_LOG}/sync.log"
