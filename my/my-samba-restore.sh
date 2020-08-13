#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

if [ -f "${MYSVIT_BACKUP}/samba/samba.zip" ]
then
  systemctl stop smbd

  unzip -o "${MYSVIT_BACKUP}/samba/samba.zip" -d /

  systemctl start smbd
fi
