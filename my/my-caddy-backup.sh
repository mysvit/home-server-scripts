#!/bin/bash
source ./my/my-config.sh

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
