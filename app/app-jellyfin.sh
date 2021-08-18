#!/bin/bash

# Install jellyfin
apt update
apt install -y wget apt-transport-https ca-certificates curl gnupg2
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | tee /etc/apt/sources.list.d/jellyfin.list
apt update
apt install jellyfin -y
