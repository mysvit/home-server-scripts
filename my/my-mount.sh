#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

mkdir $MOUNT_PATH_8T_1
mkdir $MOUNT_PATH_8T_3
mkdir $MOUNT_PATH_16T_4

echo "#primary 1 bay HDD USB 8TB  movies, cartoons, my staf" >> $FSTAB
echo "UUID=f06aee73-8316-42ec-96c5-6d84cac28e11 ${MOUNT_PATH_8T_1} ext4    errors=remount-ro 0       1 " >> $FSTAB
echo "#primary 3 bay HDD USB 8TB  sci-fi" >> $FSTAB
echo "UUID=68aa1cf3-19c6-4ee6-a12a-3e24a380fe06 ${MOUNT_PATH_8T_3} ext4    errors=remount-ro 0       1 " >> $FSTAB
echo "#primary 4 bay HDD USB 16T  backup" >> $FSTAB
echo "UUID=ba2c31ad-efce-4bb0-a75c-e5a61c248cbc ${MOUNT_PATH_16T_4} ext4   errors=remount-ro 0       1 " >> $FSTAB

mount -a

echo ""
echo "***********************************  restore MOUNT completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
