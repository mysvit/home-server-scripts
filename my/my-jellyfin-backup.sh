#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt my-jellyfin-backup.sh" >> "${MYSVIT_LOG}/jellyfin-backup.log"

systemctl stop jellyfin

# clear temp dir
rm -r /var/lib/jellyfin/transcoding-temp/transcodes/

# make folder if not exist
if [ ! -d "${MYSVIT_BACKUP}/jellyfin" ]
then
  mkdir "${MYSVIT_BACKUP}/jellyfin"
fi

# data folder
if [ -f "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip" ]
then
  rm "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip"
fi
zip -r1 "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip" /var/lib/jellyfin/*

# config
if [ -f "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip" ]
then
  rm "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip"
fi
zip -r1 "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip" /etc/jellyfin/*

systemctl start jellyfin
