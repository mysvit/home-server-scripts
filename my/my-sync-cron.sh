#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

if [ ! -d "/var/log/mysvit-sync" ]
then
  mkdir /var/log/mysvit-sync
fi

# add sync to crontab
echo "0 3 * * * /bin/sh /home/home-server-scripts/my/my-sync.sh" >> "${CRONTAB_ROOT}"
