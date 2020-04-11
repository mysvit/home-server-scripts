#!/bin/bash
clear 
echo "
0 or Ctrl+C Exit

0 Network

2 Mount folders to /mnt/* (media, backup, torrent) (my server)
21 List usb devices
22 Mount usb
23 Mount samba

3 Install media server Jellyfin and restore configuration from backup if exist

4 Install torrent client with web interface Deluge
"

echo -n "Enter number:"
read SELECT

if [ $SELECT -eq 0 ]
then
    echo "You exited from script."
else

case $SELECT in

  1)
    cd ./network
    bash index.sh
    ;;

  2)
    bash mount-my.sh
    ;;
  21)
    bash mount-usb-list.sh
    ;;
  22)
    bash mount-usb.sh
    ;;
  23)
    bash mount-samba.sh
    ;;
    
  3)
    bash install-jellyfin.sh
    ;;

  4)
    bash install-deluge.sh
    ;;

  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

# run script again simulate goto to begin
bash index.sh

fi
