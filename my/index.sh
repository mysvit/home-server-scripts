#!/bin/bash
clear
echo "
0 Go back

1 Mount my USB, Network devices and put in /etc/fstab for start up 
2 Create my Work folders (Jellyfin, Deluge, BackUp)
3 Install Jellyfin and restore metadata from backup
4 Install Deluge torrent client and restore configs from backup
40 Uninstall Deluge and backup configs
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $COMMAND in

  1)
    bash ./my/my-mount.sh
    ;;
  2)
    bash ./my/my-folders.sh
    ;;
  3)
    bash ./app/app-jellyfin.sh
    ;;
  4)
    bash ./app/app-deluge.sh
    ;;
  40)
    bash ./app/app-deluge-uninstall.sh
    ;;

  *)
    echo "unknown selected option press ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./my/index.sh

