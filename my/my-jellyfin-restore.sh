#!/bin/bash
source ./my/my-config.sh

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

systemctl start jellyfin
systemctl status jellyfin
