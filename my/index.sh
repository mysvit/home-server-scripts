#!/bin/bash
clear
echo "
0 Go back

1 Mount my USB, Network devices and put in /etc/fstab for start up 
2 Create my Work folders (Jellyfin, Deluge, BackUp)
3 Install Jellyfin and restore metadata from backup
4 Install Deluge torrent client and restore config from backup
"

echo -n "Enter number : "
read SELECT
[ $SELECT -eq 0 ] && exit

case $SELECT in

  1)
    bash ./my/my-mount.sh
    ;;
  2)
    bash ./my/my-folders.sh
    ;;
  3)
    bash ./app/app-jellyfin.sh
    bash ./my/my-jellyfin-restore.sh
    ;;
  4)
    bash ./app/app-deluge.sh
    bash ./my/my-deluge-restore.sh
    ;;

  *)
    echo "unknown selected option press ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./my/index.sh

