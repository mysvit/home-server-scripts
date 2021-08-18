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

echo '0 2 * * * bash -c "source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-caddy-backup.sh"' >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************  restore CADDY completed *******************************************"
echo ""

echo "Press Enter to continue..."
read
