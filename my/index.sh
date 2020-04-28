#!/bin/bash
clear
echo "
0 Go back

1 Mount my USB, Network devices and put in /etc/fstab for start up 
2 Create my Work folders (Jellyfin, Deluge, BackUp)
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $SELECT in

  1)
    bash ./my/my-mount.sh
    ;;
  2)
    bash ./my/my-folders.sh
    ;;

  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./my/index.sh

