#!/bin/bash
clear 
echo "
0 Go back

1  - Install JELLYFIN - media server - server_ip:8096

2  - Install DELUGE - torrent client with web ui - server_ip:8112 (default password: deluge)
20 - Remove DELUGE

3  - Install SAMBA - windows file share
30 - Remove SAMBA

91 - mc : Midnight commander - file manager
92 - ffmpeg : video tools
93 - caddy: platform for server app with https
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

  20)
    bash ./app/app-deluge-remove.sh
    ;;

  3)
    bash ./app/app-samba.sh
    ;;
  30)
    bash ./app/app-samba-remove.sh
    ;;

  91)
    bash ./app/app-mc.sh
    ;;
  92)
    bash ./app/app-ffmpeg.sh
    ;;

  *)
    echo "unknown option."
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./app/index.sh
