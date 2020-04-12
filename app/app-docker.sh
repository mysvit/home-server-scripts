#!/usr/bin/env bash

apt update
apt install -y  apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update

apt install -y docker-ce docker-ce-cli containerd.io
docker run hello-world

# The message will appear
# Hello from Docker!
# ...
 
