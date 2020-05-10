#!/bin/bash
source my-config.sh

# make foledr if not exist
mkdir "${SL_BACKUP}/deluge"
# backup config
rm "${SL_BACKUP}/deluge/config.zip"
zip -r1 "$SL_BACKUP/deluge/config.zip" /home/deluge/.config/deluge/*
