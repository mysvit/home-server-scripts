#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

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
