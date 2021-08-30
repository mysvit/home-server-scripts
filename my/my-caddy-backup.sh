#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt my-caddy-backup.sh" >> "${MYSVIT_LOG}/my-caddy-backup.log"

# make folder if not exist
if [ ! -d "${MYSVIT_BACKUP}/caddy" ]
then
  mkdir "${MYSVIT_BACKUP}/caddy"
fi

# backup config
if [ -f "${MYSVIT_BACKUP}/caddy/Caddyfile" ]
then
  rm "${MYSVIT_BACKUP}/caddy/Caddyfile"
fi

cp /etc/caddy/Caddyfile "${MYSVIT_BACKUP}/caddy/Caddyfile"
