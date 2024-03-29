#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# install deluge
bash /home/home-server-scripts/app/app-deluge.sh

echo ""
echo "***********************************  restore DELUGE from backup **************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

chown -R deluge:deluge $MYSVIT_DELUGE
find $MYSVIT_DELUGE -type d -exec chmod 755 {} \;

if [ -f "${MYSVIT_BACKUP}/deluge/config.zip" ]
then
  systemctl stop deluged
  systemctl stop deluge-web

  unzip -o "${MYSVIT_BACKUP}/deluge/config.zip" -d /
  chown -R deluge:deluge /home/deluge/.config/deluge/*
  find /home/deluge/.config/deluge -type d -exec chmod 700 {} \;
  find /home/deluge/.config/deluge -type f -exec chmod 600 {} \;

  systemctl start deluged
  systemctl start deluge-web
  
  systemctl status deluged -l --no-pager
  systemctl status deluge-web -l --no-pager
fi

# add sync to crontab
echo "add sync to crontab"

echo "#!/bin/sh
/home/home-server-scripts/my/my-deluge-backup.sh" > /etc/cron.daily/my-deluge-backup
chmod 755 /etc/cron.daily/my-deluge-backup

echo ""
echo "***********************************  restore DELUGE completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
