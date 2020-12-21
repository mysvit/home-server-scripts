#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

if [ ! -d ${MYSVIT_LOG} ]
then
  mkdir ${MYSVIT_LOG}
fi

# add sync to crontab
echo "add sync to crontab"

echo "0 3 * * * /bin/sh /home/home-server-scripts/my/my-sync.sh" >> "${CRONTAB_ROOT}"
