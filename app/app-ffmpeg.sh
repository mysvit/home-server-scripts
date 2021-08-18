#!/bin/bash
wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://mkvtoolnix.download/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | tee /etc/apt/sources.list.d/mkvtoolnix.download.list
apt update
echo "******************************************************************************"
echo "FFMPEG & MKVTOOLNIX"
echo "******************************************************************************"
apt install ffmpeg -y
apt install mkvtoolnix -y
