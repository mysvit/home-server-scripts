#!/usr/bin/bash
clear 
echo "
0 Exit

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

case $SELECT in

  0)
    echo -n "Exit"
    ;;

  1)
    bash network-restart.sh
    bash build-server.sh
    ;;

  11)
    bash network-interfaces.sh
    bash build-server.sh
    ;;

  12)
    bash network-hostname.sh
    bash build-server.sh
    ;;

  21)
    echo -n "12"
    bash build-server.sh
    ;;

  22)
    echo -n "12"
    bash build-server.sh
    ;;

  *)
    echo -n "unknown"
    bash build-server.sh
    ;;
esac
