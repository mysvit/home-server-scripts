#!/bin/bash
source my-config.sh

systemctl stop jellyfin

# data folder
rm $SL-BACKUP/jellyfin/var-lib-jellyfin.zip
zip -r1 $SL-BACKUP/jellyfin/var-lib-jellyfin.zip /var/lib/jellyfin/*
# config
rm $SL-BACKUP/jellyfin/etc-jellyfin.zip
zip -r1 $SL-BACKUP/jellyfin/etc-jellyfin.zip /etc/jellyfin/*

systemctl start jellyfin
