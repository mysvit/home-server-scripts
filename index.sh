#!/bin/bash
clear 
echo "
0 or Ctrl+C Exit

1 My Scripts (mount usb, make work forlders)

2 Network
3 Devices
4 Mount devices (StartUp)
5 Install Applications
6 Install server on USB
"

echo -n "Enter number : "
read COMMAND

[ $COMMAND -eq 0 ] &&  echo "Сame out!"  && exit

case $COMMAND in
  1)
    bash ./my/index.sh
    ;;
  2)
    bash ./network/index.sh
    ;;
  3)
    bash ./devices/index.sh
    ;;
  4)
    bash ./mount/index.sh
    ;;
  5)
    bash ./app/index.sh
    ;;
  6)
    bash ./os/index.sh
    ;;
  *)
    echo "unknown option press any key to restart : "
    read
    ;;
esac

# run script again simulate goto to begin
bash index.sh
