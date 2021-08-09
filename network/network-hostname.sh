#!/usr/bin/bash
f="/etc/hostname"
echo "see /etc/hostname"
clear

currentHostName=$(cat "$f")
echo "---=== Change hostname ===---"
echo
echo -n "Enter new hostname or press Enter to use curren [$currentHostName] : "
read newHostName
if [ -z "$newHostName" ]
then
  echo "Used current [$currentHostName]"
  echo "press ENTER to continue"
  read
else
  echo "New hostname [$newHostName]"
  echo $newHostName > $f
  bash ./network/network-restart.sh
fi
