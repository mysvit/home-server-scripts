#!/bin/bash
clear 
echo "
0 Go back

1 Jellyfin - media server - server_ip:8096
2 Deluge - torrent client with web ui - server_ip:8112
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

  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./app/index.sh
