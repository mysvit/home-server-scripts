#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt my-deluge-backup.sh" >> "${MYSVIT_LOG}/sync.log"

# make folder if not exist
if [ ! -d "${MYSVIT_BACKUP}/deluge" ]
then
  mkdir "${MYSVIT_BACKUP}/deluge"
fi

# backup config
if [ -f "${MYSVIT_BACKUP}/deluge/config.zip" ]
then
  rm "${MYSVIT_BACKUP}/deluge/config.zip"
fi

zip -r1 "${MYSVIT_BACKUP}/deluge/config.zip" /home/deluge/.config/deluge/*
