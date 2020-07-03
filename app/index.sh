#!/bin/bash
clear 
echo "
0 Go back

1  - Install JELLYFIN - media server - server_ip:8096
2  - Install DELUGE - torrent client with web ui - server_ip:8112 (default password: deluge)
3  - Install SAMBA - windows file share

91 - mc : Midnight commander - file manager
92 - ffmpeg : video tools
93 - caddy: platform for server app with https

TO REMOVE ANY APP ADD TWO ZEROS TO THE END OF INSTALL NUMBER
Example: to remove FFMPEG type 9200
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

  200)
    bash ./app/app-deluge-remove.sh
    ;;

  3)
    bash ./app/app-samba.sh
    ;;
  300)
    bash ./app/app-samba-remove.sh
    ;;

  91)
    bash ./app/app-mc.sh
    ;;
  92)
    bash ./app/app-ffmpeg.sh
    ;;
  93)
    bash ./app/app-caddy.sh
    ;;
  9300)
    bash ./app/app-caddy-remove.sh
    ;;

  *)
    echo "unknown option."
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./app/index.sh
