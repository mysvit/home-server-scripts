#!/bin/bash
source my-config.sh

systemctl stop jellyfin

# make foledr if not exist
mkdir "${SL_BACKUP}/jellyfin"
# data folder
rm "${SL_BACKUP}/jellyfin/var-lib-jellyfin.zip"
zip -r1 "${SL_BACKUP}/jellyfin/var-lib-jellyfin.zip" /var/lib/jellyfin/*
# config
rm "${SL_BACKUP}/jellyfin/etc-jellyfin.zip"
zip -r1 "${SL_BACKUP}/jellyfin/etc-jellyfin.zip" /etc/jellyfin/*

systemctl start jellyfin
