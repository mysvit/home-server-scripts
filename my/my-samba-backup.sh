#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt my-samba-backup.sh" >> "${MYSVIT_LOG}/sync.log"

# make foledr if not exist
if [ ! -d "${MYSVIT_BACKUP}/samba" ]
then
  mkdir "${MYSVIT_BACKUP}/samba"
fi

# backup config
if [ -f "${MYSVIT_BACKUP}/samba/samba.zip" ]
then
  rm "${MYSVIT_BACKUP}/samba/samba.zip"
fi

zip -r1 "$MYSVIT_BACKUP/samba/samba.zip" /etc/samba/*
