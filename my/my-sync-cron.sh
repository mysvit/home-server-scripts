#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

mkdir /var/log/mysvit-sync
# add sync to crontab
echo "0 3 * * * /bin/sh /home/home-server-scripts/my/my-sync.sh" >> "${CRONTAB_ROOT}"
