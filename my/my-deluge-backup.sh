#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# make foledr if not exist
mkdir "${MYSVIT_BACKUP}/deluge"
# backup config
if [ -f "${MYSVIT_BACKUP}/deluge/config.zip" ]
then
  rm "${MYSVIT_BACKUP}/deluge/config.zip"
fi
zip -r1 "$MYSVIT_BACKUP/deluge/config.zip" /home/deluge/.config/deluge/*
