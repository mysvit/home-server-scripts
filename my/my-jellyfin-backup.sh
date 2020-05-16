#!/bin/bash
source my-config.sh

systemctl stop jellyfin

# make foledr if not exist
mkdir "${MYSVIT_BACKUP}/jellyfin"
# data folder
rm "${MYSVIT_BACKUP}/jellyfin/var-lib-jellyfin.zip"
zip -r1 "${SL_BACKUP}/jellyfin/var-lib-jellyfin.zip" /var/lib/jellyfin/*
# config
rm "${MYSVIT_BACKUP}/jellyfin/etc-jellyfin.zip"
zip -r1 "${SL_BACKUP}/jellyfin/etc-jellyfin.zip" /etc/jellyfin/*

systemctl start jellyfin
