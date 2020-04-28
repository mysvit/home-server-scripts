#!/bin/bash
source my-config.sh

# HDD 8TB
echo "# HDD USB 8TB $USB-DEV-8T-1" >> $FSTAB
echo "UUID=$USB-ID-8T-1 $PATH-8T-1 auto nosuid,nodev,nofail 0 0" >> $FSTAB

# HDD 500GB
echo "# USB HDD 500GB  $USB-DEV-500G-1" >> $FSTAB
echo "UUID=$USB-DEV-500G-1 $PATH-500G-1 auto nosuid,nodev,nofail 0 0" >> $FSTAB

mkdir $PATH-8T-1
mkdir $PATH-500G-1

nano $FSTAB
mount -a
