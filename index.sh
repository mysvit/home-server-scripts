#!/bin/bash
clear 
echo "
0 or Ctrl+C Exit

1 My Scripts (mount usb, make work forlders)

2 Network
3 Devices
4 Mount devices (StartUp)
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
    bash ./my/index.sh
    ;;

  2)
    bash ./network/index.sh
    ;;

  3)
    bash ./mount/index.sh
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
