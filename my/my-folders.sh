#!/bin/bash

# media, torrent(deluge), backup folders
d-deluge=$mnt-hdd-500G-1
sl-deluge="/mnt/deluge"
d-media="$mnt-hdd-8T-1/media"
sl-media="/mnt/media"
d-backup="$mnt-hdd-8T-1/backup"
sl-backup="/mnt/backup"
d-backup-jellyfin="$mnt-hdd-8T-1/backup/jellyfin"

echo
echo "###################################################################"
echo "$mounMedia"
echo "$mounDeluge"
echo "###################################################################"
echo
echo -n "Do you want to make next folders (n : just view) Y/n : "
read yesNo

if [ "$yesNo" = "Y" ] || ["$yesNo" = "y" ]
then
  mkdir $d-backup-jellyfin
  ln -s $d-media $sl-media
  ln -s $d-deluge $sl-deluge
  ln -s $d-backup $sl-backup
fi
