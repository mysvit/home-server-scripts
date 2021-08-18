#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# install deluge
bash /home/home-server-scripts/app/app-jellyfin.sh

echo ""
echo "***********************************  restore JELLYFIN from backup **********************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

if [ -f "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip" ] && [ -f "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip" ]
then
  systemctl stop jellyfin

  chown -R jellyfin:jellyfin "${MYSVIT_BACKUP}/jellyfin/*"
  find "${MYSVIT_BACKUP}/jellyfin" -type d -exec chmod 755 {} \;
  find "${MYSVIT_BACKUP}/jellyfin" -type f -exec chmod 644 {} \;

  unzip -o "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip" -d /
  chown -R jellyfin:jellyfin /var/lib/jellyfin/*
  find /var/lib/jellyfin -type d -exec chmod 755 {} \;
  find /var/lib/jellyfin -type f -exec chmod 644 {} \;

  unzip -o "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip" -d /
  chown -R jellyfin:jellyfin /etc/jellyfin/*
  find /etc/jellyfin -type d -exec chmod 755 {} \;
  find /etc/jellyfin -type f -exec chmod 644 {} \;

  systemctl start jellyfin -l --no-pager
  systemctl status jellyfin -l --no-pager
fi

echo '0 2 * * * bash -c "source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-jellyfin-backup.sh"' >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************  restore JELLYFIN completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
