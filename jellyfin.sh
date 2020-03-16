#!/usr/bin/env bash

# Install jellyfin
apt update
apt install -y wget apt-transport-https ca-certificates curl gnupg2 software-properties-common
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | tee /etc/apt/sources.list.d/jellyfin.list
apt update
apt install jellyfin -y

#restore from backup
systemctl stop jellyfin

unzip -o /mnt/backup/jellyfin/var-lib-jellyfin.zip -d /
chown -R jellyfin:jellyfin /var/lib/jellyfin/*
find /var/lib/jellyfin -type d -exec chmod 755 {} \;
find /var/lib/jellyfin -type f -exec chmod 644 {} \;

unzip -o /mnt/backup/jellyfin/etc-jellyfin.zip -d /
chown -R jellyfin:jellyfin /etc/jellyfin/*
find /etc/jellyfin -type d -exec chmod 755 {} \;
find /etc/jellyfin -type f -exec chmod 644 {} \;

systemctl start jellyfin
