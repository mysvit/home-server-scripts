#!/bin/bash
clear 
echo "
0 Go back

1 Jellyfin - media server - server_ip:8096
2 Deluge - torrent client with web ui - server_ip:8112 (default password: deluge)
10 Midnight commander (mc)- file manager
"
echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $COMMAND in

  1)
    bash ./app/app-jellyfin.sh
    ;;

  2)
    bash ./app/app-deluge.sh
    ;;

  10)
    bash ./app/app-mc.sh
    ;;

  *)
    echo "unknown option."
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./app/index.sh
