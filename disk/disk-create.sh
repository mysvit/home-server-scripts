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

  # parted /dev/YOUR DISK

  (parted) mklabel gpt      : to set the partition table format to GPT
  (parted) print free       : to see free space
  (parted) mkpart primary 0GB 8002GB  : for 8TB
  (parted) quit

  # fdisk -l              : to see your changes

  to format partition
  # mkfs.ext4 /dev/YOUR DISK    : wait for :DONE! øø
"
read
