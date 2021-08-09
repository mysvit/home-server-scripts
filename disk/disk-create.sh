#!/bin/bash
apt update
apt install parted
clear
echo "
  # fdisk -l     show all disks
  use    # fdisk /dev/YOUR DISK    ( /dev/sdb for example )
  to delete partition: d
  to write changes: w

  use # parted              : command to create new partition

  parted /dev/YOUR DISK(SDA) mklabel gpt      : to set the partition table format to GPT
  parted /dev/YOUR DISK(SDA) print free       : to see free space
  parted -a optimal /dev/YOUR DISK(SDA) mkpart primary 0% 640GB     : optimal blocks 

  # fdisk -l              : to see your changes

  to format partition
  # mkfs.ext4 /dev/YOUR DISK    : wait for :DONE! øø
"
read
