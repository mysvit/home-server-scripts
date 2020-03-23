#!/bin/bash
clear 
echo "
0 or Ctrl+C Exit

Network setup
1  Restart
11 Interfaces
12 Hostname

Mount folders to /mnt/*
2  List usb devices
21 Media folder
22 Backup folder

"

echo -n "Enter number:"
read SELECT

echo $SELECT

if [ "$SELECT" = "0" ]
then
    echo "You exited from script."
else

case $SELECT in

  1)
    bash network-restart.sh
    ;;

  11)
    bash network-interfaces.sh
    ;;

  12)
    bash network-hostname.sh
    ;;

  2)
    bash mount-list.sh
    ;;

  22)
    echo -n "12"
    ;;

  *)
    echo -n "unknown"
    ;;
esac

# run script again simulate goto to begin
#bash build-server.sh

fi
