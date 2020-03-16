#!/bin/bash

# backup
# data folder
rm /mnt/backup/jellyfin/var-lib-jellyfin.zip
zip -r1 /mnt/backup/jellyfin/var-lib-jellyfin.zip /var/lib/jellyfin/*
# config
rm /mnt/backup/jellyfin/etc-jellyfin.zip
zip -r1 /mnt/backup/jellyfin/etc-jellyfin.zip /etc/jellyfin/*
