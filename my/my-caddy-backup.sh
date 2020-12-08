#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

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

zip -r1 "${MYSVIT_BACKUP}/caddy/Caddyfile" /etc/caddy/Caddyfile
