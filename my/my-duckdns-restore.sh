#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

echo ""
echo "***********************************   add duck dns to crontab ***************************************"
echo ""

# install duck dns to crontab
echo "* * * * * /bin/sh /mysvit/web/duckdns.sh >/dev/null 2>&1" >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************      duckdns added to crontab  *********************************"
echo ""

echo "Press Enter to continue..."
read
