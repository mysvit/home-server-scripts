#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

apt update
apt install -y zip
apt install -y unzip

echo ""
echo "***********************************   create folder structure ***************************************"
echo ""

mkdir $MYSVIT

#backup
rm $MYSVIT_BACKUP
ln -s $PH_BACKUP $MYSVIT_BACKUP

#deluge
mkdir $MYSVIT_DELUGE
mkdir $MYSVIT_DELUGE_TORRENTS
mkdir $MYSVIT_DELUGE_DOWNLOAD
mkdir $MYSVIT_DELUGE_COMPLEATED
mkdir $MYSVIT_WEB
mkdir $MYSVIT_SYNC
mkdir $MYSVIT_WORK

#media movie
mkdir $MYSVIT_MEDIA
mkdir $MYSVIT_MOVIES

ln -s $PH_MYSVIT_AUDIO $MYSVIT_AUDIO
ln -s $PH_MYSVIT_BOOKS $MYSVIT_BOOKS
ln -s $PH_MYSVIT_CARTOONS $MYSVIT_CARTOONS
ln -s $PH_MYSVIT_MOVIES_ALL $MYSVIT_MOVIES_ALL
ln -s $PH_MYSVIT_MOVIES_SCI_FI $MYSVIT_MOVIES_SCI_FI
ln -s $PH_MYSVIT_MY_PHOTO $MYSVIT_MY_PHOTO
ln -s $PH_MYSVIT_MY_PRIVATE $MYSVIT_MY_PRIVATE
ln -s $PH_MYSVIT_MY_VIDEO $MYSVIT_MY_VIDEO

echo ""
echo "*********************************** create folder structure COMPLETED *********************************"
echo ""

echo "Press Enter to continue..."
read
