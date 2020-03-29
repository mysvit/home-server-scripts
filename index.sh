#!/bin/bash
clear 
echo "
0 or Ctrl+C Exit

1 Network setup (my server)
10 Network restore initial files
11 Restart network
12 Interfaces
13 Hostname

2 Mount folders to /mnt/* (media, backup, torrent) (my server)
21 List usb devices
22 Mount usb
23 Mount samba

"

echo -n "Enter number:"
read SELECT

if [ $SELECT -eq 0 ]
then
    echo "You exited from script."
else

case $SELECT in

  1)
    bash network-my.sh
    ;;
  10)
    bash network-restore.sh
    ;;
  11)
    bash network-restart.sh
    ;;
  12)
    bash network-interfaces.sh
    ;;
  13)
    bash network-hostname.sh
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

  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

# run script again simulate goto to begin
bash index.sh

fi
