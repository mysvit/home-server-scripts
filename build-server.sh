#!/usr/bin/bash

clear 

echo 0 Exit
echo
echo "Network setup"
echo "1  Restart"
echo "11 Interfaces"
echo "12 Hostname"
echo
echo Mount folders to mnt
echo 21 backup 
echo 22 media
echo
echo 31 torrent work folders

echo
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
