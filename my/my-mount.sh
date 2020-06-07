#!/bin/bash
source ./my/my-config.sh
apt install -y ntfs-3g

# HDD 8TB
echo "# HDD USB 8TB $USB_DEV_8T_1" >> $FSTAB
echo "UUID=$USB_ID_8T_1 $MOUNT_PATH_8T_1   ntfs-3g        defaults    0    0" >> $FSTAB


# HDD 500GB
#echo "# USB HDD 500GB  $USB_DEV_500G_1" >> $FSTAB
#echo "UUID=$USB_DEV_500G_1 $MOUNT_PATH_500G_1 auto nosuid,nodev,nofail 0 0" >> $FSTAB

mkdir $MOUNT_PATH_8T_1
#mkdir $MOUNT_PATH_500G_1

nano $FSTAB
mount -a
