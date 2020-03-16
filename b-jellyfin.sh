#!/bin/bash

# backup data folder
zip -r0 /mnt/backup/jellyfin/var-lib-jellyfin.zip /var/lib/jellyfin/*
zip -r0 /mnt/backup/jellyfin/etc-jellyfin.zip /etc/jellyfin/*
