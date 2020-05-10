#!/bin/bash
source my-config.sh

mkdir $MYSVIT
mkdir $MYSVIT_DELUGE

rm $SL_BACKUP
ln -s $PH_BACKUP $SL_BACKUP

rm $SL_MEDIA
ln -s $PH_MEDIA $SL_MEDIA

rm $SL_D_DOWNLOAD
ln -s $MOUNT_PATH_500G_1 $SL_D_DOWNLOAD
