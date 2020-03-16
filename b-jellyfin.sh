#!/bin/bash

# backup
# data folder
zip -r1 /mnt/backup/jellyfin/var-lib-jellyfin.zip /var/lib/jellyfin/*
# config
zip -r1 /mnt/backup/jellyfin/etc-jellyfin.zip /etc/jellyfin/*
