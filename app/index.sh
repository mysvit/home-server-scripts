#!/bin/bash
clear 
echo "
0 Go back

1 Install media server Jellyfin and restore configuration from backup if exist
2 Install torrent client with web interface Deluge
"
echo -n "Enter number : "
read SELECT

if [ $SELECT -eq 0 ]
then
    echo "You exited from script."
else

case $SELECT in

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

# run script again simulate goto to begin
bash index.sh

fi
