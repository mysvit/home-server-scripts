#!/usr/bin/env bash
apt update
apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install nodejs
npm i cloudcmd -g
