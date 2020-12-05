#!/bin/bash
clear
echo "
0 Go back

1 Mount my USB, Network devices and put in /etc/fstab for start up 
2 Create my Work folders (Jellyfin, Deluge, BackUp)

3 Install JELLYFIN and restore metadata from backup

4 Install DELUGE, restore configs from backup and add backup script to crontab
40 Remove DELUGE and remove backup script from crontab (it will make backup before remove)

5 Install Samba and restore config from backup

6 Install Caddy

7 Install Duck dns

8 Add mirror by rsync to crontab

99 Install Additional apps (mc, ffmpeg, mkvtoolnix)
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
    bash ./my/my-jellyfin.sh
    ;;
  4)
    bash ./my/my-deluge.sh
    ;;
  40)
    bash ./my/my-deluge-remove.sh
    ;;
  5)
    bash ./my/my-samba.sh
    ;;
  6)
    bash ./my/my-caddy.sh
    ;;
  7)
    bash ./my/my-duckdns.sh
    ;;
  8)
    bash ./my/my-sync-cron.sh
    ;;
  99)
    bash ./app/app-mc.sh
    bash ./app/app-ffmpeg.sh
    ;;
  *)
    echo "unknown selected option press ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./my/index.sh

