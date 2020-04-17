#!/bin/bash
clear
echo "
0 Go back

1 List hdd and usb devices
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -ne 1 ] && exit

case $COMMAND in
  1)
    bash ./disk/disk-list.sh
    ;;

  *)
    echo "unknown option pres ENTER to restart"
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./usb/index.sh
