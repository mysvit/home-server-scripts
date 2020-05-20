#!/bin/bash
source my-config.sh

# make foledr if not exist
mkdir "${MYSVIT_BACKUP}/deluge"
# backup config
rm "${MYSVIT_BACKUP}/deluge/config.zip"
zip -r1 "$MYSVIT_BACKUP/deluge/config.zip" /home/deluge/.config/deluge/*
