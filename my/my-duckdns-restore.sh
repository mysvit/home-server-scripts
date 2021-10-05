#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

echo ""
echo "***********************************   add duck dns to crontab ***************************************"
echo ""

# add sync to crontab
echo "add sync to crontab"

# install duck dns to crontab
echo "#!/bin/sh
/mysvit/web/duckdns.sh >/dev/null 2>&1" > /etc/cron.hourly/my-duckdns
chmod 755 /etc/cron.hourly/my-duckdns

echo ""
echo "***********************************      duckdns added to crontab  *********************************"
echo ""

echo "Press Enter to continue..."
read
