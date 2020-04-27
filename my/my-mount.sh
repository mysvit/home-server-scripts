#!/bin/bash
FSTAB="/etc/fstab"

# HDD 8TB
usb-dev-8T-1="/dev/sdc1"
usb-id-8T-1="FGH09H-GJH984"
path-8T-1="/mnt/hdd-8T-1"
echo "# HDD USB 8TB $usb-dev-8T-1" >> $FSTAB
echo "UUID=$usb-id-8T-1 $path-8T-1 auto nosuid,nodev,nofail 0 0" >> $FSTAB

# HDD 500GB
usb-dev-500G-1="/dev/sdc2"
usb-id-500G-1="??????-GJH984"
path-500G-1="/mnt/hdd-500G-1"
echo "# USB HDD 500GB  $usb-dev-500G-1" >> $FSTAB
echo "UUID=$usb-dev-500G-1 $path-500G-1 auto nosuid,nodev,nofail 0 0" >> $FSTAB

mkdir $path-8T-1
mkdir $path-500G-1

nano $FSTAB
mount -a
