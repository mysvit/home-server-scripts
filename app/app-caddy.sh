#!/bin/bash

# Install Caddy 2
echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" | tee -a /etc/apt/sources.list.d/caddy-fury.list
apt update

echo
echo Caddy 2
echo 
apt install caddy -y
