#!/usr/bin/env bash

echo
echo
echo
echo
echo

echo 0 Exit
echo
echo Network setup
echo 11 interfaces
echo 12 interfaces
echo
echo 2 Mount folders to mnt
echo 21 backup 
echo 22 media
echo
echo 31 torrent work folders

# 2. 

echo -n "Enter number:"
read SELECT

case $SELECT in

  0)
    echo -n "0"
    ;;

  11)
    echo -n "11"
    bash build-server.sh
    ;;

  12)
    echo -n "12"
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
    ;;
esac
