#!/bin/bash
clear
echo "
0 Go back

1 List hdd and usb devices (fdisk -l)
2 Mount on startup usb disk
3 Instruction how to create and format to ext4
91 Install support ntfs
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
  3)
    bash ./disk/disk-create.sh
    ;;
  91)
    bash ./disk/disk-ntfs-3g.sh
    ;;
  *)
    echo "unknown option pres ENTER to restart"
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./disk/index.sh
