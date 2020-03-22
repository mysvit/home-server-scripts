#!/usr/bin/env bash

f="/etc/hostname"
hostname=$(cat "$f")

echo "Change hostname"

echo -n "Enter hostname : "
read $hostname

echo $hostname > $f

bash network-restart.sh
