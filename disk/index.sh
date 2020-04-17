#!/bin/bash
clear
echo "
0 Go back

1 List hdd and usb devices (fdisk -l)
2 Mount on startup usb disk
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $COMMAND in
  1)
    bash ./disk/disk-list.sh
    ;;
  2)
    bash ./disk/disk-mount-usb.sh
    ;;
  *)
    echo "unknown option pres ENTER to restart"
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./disk/index.sh
