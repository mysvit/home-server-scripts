#!/bin/bash
apt update
apt install -y wget apt-transport-https ca-certificates curl gnupg2
wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
echo "deb [signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ bullseye main" > /etc/apt/sources.list.d/mkvtoolnix.download.list
apt update
echo "******************************************************************************"
echo "FFMPEG & MKVTOOLNIX"
echo "******************************************************************************"
echo "*** ffmpeg ***"
apt install ffmpeg -y
echo "*** mkvtoolnix ***"
apt install mkvtoolnix -y
