#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt" >> /var/log/mysvit-sync/sync.log
echo "rsync -arv /media/hdd-8T-1/ /media/hdd-8T-3/ >> /var/log/mysvit-sync/sync.log" >> /var/log/mysvit-sync/sync.log

chown -R jellyfin:jellyfin /media/hdd-8T-1/
chown -R jellyfin:jellyfin /media/hdd-8T-3/
chmod -R 755 /media/hdd-8T-1/
chmod -R 755 /media/hdd-8T-3/

rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/ >> /var/log/mysvit-sync/sync.log
