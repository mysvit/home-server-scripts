#!/bin/bash
source ./my/my-config.sh

if [ -f "${MYSVIT_BACKUP}/caddy/Caddyfile" ]
then
  caddy stop

  cp -o "${MYSVIT_BACKUP}/caddy/Caddyfile" -d /

  caddy start
fi