#!/bin/bash
source my-config.sh

mkdir $MYSVIT
mkdir $MYSVIT-DELUGE

rm $SL-BACKUP
ln -s $PH-BACKUP $SL-BACKUP

rm $SL-MEDIA
ln -s $PH-MEDIA $SL-MEDIA

rm $SL-D-DOWNLOAD
ln -s $MOUNT-PATH-500G-1 $SL-D-DOWNLOAD
