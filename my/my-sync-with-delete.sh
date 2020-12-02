#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

rsync -arvn --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/

echo -n "Do you want run this command for sync with delete: rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/"
echo -n "[Y/N]:"
read YES_NO
[ -z $YES_NO ] || [ "$YES_NO" = "n" ] || [ "$YES_NO" = "N" ] && echo "Answer no! Script canceled!" && exit

rsync -arv --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/
