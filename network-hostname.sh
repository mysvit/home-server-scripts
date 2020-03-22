#!/usr/bin/bash

clear

f="/etc/hostname"
echo $name
currentHostName=$(cat "$f")
echo "---=== Change hostname ===---"
echo
echo -n "Enter new hostname or press Enter to use curren [$currentHostName] : "
read newHostName
if [ -z "$newHostName" ]
then
  echo "Used current [$currentHostName]"
else
  echo "New hostname [$newHostName]"
  echo $newHostName > $f
  bash network-restart.sh
fi

echo "press ENTER to continue"
read
