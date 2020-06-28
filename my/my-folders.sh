#!/bin/bash
source ./my/my-config.sh

apt update
apt install -y zip
apt install -y unzip

mkdir $MYSVIT

rm $MYSVIT_BACKUP
ln -s $PH_BACKUP $MYSVIT_BACKUP

rm $MYSVIT_MEDIA
ln -s $PH_MEDIA $MYSVIT_MEDIA

mkdir $MYSVIT_DELUGE
mkdir $MYSVIT_DELUGE_TORRENTS
mkdir $MYSVIT_DELUGE_DOWNLOAD
mkdir $MYSVIT_DELUGE_COMPLEATED
mkdir $MYSVIT_WORK
#rm $MYSVIT_DELUGE_DOWNLOAD
#ln -s $MOUNT_PATH_500G_1 $MYSVIT_DELUGE_DOWNLOAD
