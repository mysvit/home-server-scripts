#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

bash /home/home-server-scripts/app/app-caddy.sh

echo ""
echo "***********************************  restore CADDY from backup ******************************************"
echo ""

if [ -f "${MYSVIT_BACKUP}/caddy/Caddyfile" ]
then
  caddy stop

  cp "${MYSVIT_BACKUP}/caddy/Caddyfile" /etc/caddy/Caddyfile

  caddy start
fi

# add sync to crontab
echo "add sync to crontab"

echo "#!/bin/sh
/home/home-server-scripts/my/my-caddy-backup.sh" > /etc/cron.daily/my-caddy-backup
chmod 755 /etc/cron.daily/my-caddy-backup

echo ""
echo "***********************************  restore CADDY completed *******************************************"
echo ""

echo "Press Enter to continue..."
read
