#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

rsync -arv /media/hdd-8T-1/ /media/hdd-8T-3/ >> /var/log/mysvit-sync/sync.log
