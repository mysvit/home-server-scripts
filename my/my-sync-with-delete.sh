#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo "rsync -arvn --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/"
echo ""

rsync -arvn --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/

echo "Do you want run this command for sync with delete: rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/"
echo -n "[Y/N]:"
read YES_NO
[ -z $YES_NO ] || [ "$YES_NO" = "n" ] || [ "$YES_NO" = "N" ] && echo "Answer no! Script canceled!" && exit

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt" >> /var/log/mysvit-sync/sync.log
echo "rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/"
rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/
