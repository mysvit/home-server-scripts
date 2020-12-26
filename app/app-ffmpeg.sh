#!/bin/bash
wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb https://mkvtoolnix.download/debian/ buster main" > /etc/apt/sources.list.d/mkvtoolnix.download.list
apt update
echo 
echo FFMPEG & MKVTOOLNIX
echo 
apt install ffmpeg -y
apt install mkvtoolnix -y
