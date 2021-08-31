#!/bin/bash
wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb [signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | tee /etc/apt/sources.list.d/mkvtoolnix.download.list
apt update
echo "******************************************************************************"
echo "FFMPEG & MKVTOOLNIX"
echo "******************************************************************************"
echo "*** ffmpeg ***"
apt install ffmpeg -y
echo "*** mkvtoolnix ***"
apt install mkvtoolnix -y
