#!/bin/bash
clear
echo "
0 Go back

1 Create Debian Server 10 usb key with auto install
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -ne 1 ] && exit

case $COMMAND in
  1)
    bash ./os/os-create-debian-10-usb-key.sh
    ;;

  *)
    echo "unknown option pres ENTER to restart"
    read
    ;;
esac

echo "Script finished. Press any key to continue : "
read
bash ./os/index.sh
