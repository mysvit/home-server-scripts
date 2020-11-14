#!/bin/bash
apt update
echo 
echo Youtube-dl
echo 
apt install youtube-dl -y
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl

