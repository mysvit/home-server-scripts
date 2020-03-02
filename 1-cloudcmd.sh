#!/usr/bin/env bash
apt install curl dirmngr apt-transport-https lsb-release ca-certificates -y
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install nodejs -y
npm install cloudcmd -g
