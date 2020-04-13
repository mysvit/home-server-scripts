#!/bin/bash
set -e -x -o pipefail

apt update
apt install -y rsync
apt install -y wget

CURRENT_DATE=$(date +%Y-%m-%d_%H:%M)
DIRNAME="$(dirname $0)"

: "${DEBIAN_RELEASE:=buster}"
: "${DEBIAN_VERSION:=10.3.0}"
: "${DEBIAN_MIRROR:=http://ftp.debian.org}"
: "${ARCH:=amd64}"
: "${REMOTE_ISO:=https://cdimage.debian.org/debian-cd/current/${ARCH}/iso-cd/debian-${DEBIAN_VERSION}-${ARCH}-netinst.iso}"
ISO_NAME="${REMOTE_ISO##*/}"

ANYKEY="Press any key to restart"

##### INPUT
:===============================================================================
fdisk -l | grep "Disk /dev"
:===============================================================================
echo "====      IF YOU HAVE HARD DRIVES WITH YOU MEDIA DATA CONNECTED TO USB    ====="
echo "====                   FOR SEFATY PERPUSE DISCONECT THEM.                 ====="
echo "====          TO AVOID ERASE DATA IF YOU CHOUCE WRONG USB DEVICE          ====="
echo "==============================================================================="
echo -n "Enter usb key device from list (/dev/sdb for example) : "
read DISK
[ -z ${DISK} ] && echo "Please provide root password." && echo $ANYKEY && read && exit

echo -n "Enter root password : "
read ROOT_PWD
[ -z ${ROOT_PWD} ] && echo "Please provide root password." && echo $ANYKEY && read && exit

echo -n enter username for SSH session:
read USER
[ -z ${USER} ] && echo "Please provide username."  && echo $ANYKEY && read && exit

echo -n enter user password for SSH session:
read USER_PWD
[ -z ${USER_PWD} ] && echo "Please provide user password."  && echo $ANYKEY && read && exit

##### ACTION

echo "----- Getting ISO"
wget --continue -O "${DIRNAME}/${ISO_NAME}" "${REMOTE_ISO}"
ISO="${DIRNAME}/${ISO_NAME}"

echo "----- Wiping out beginning of ${DISK}"
dd if=/dev/zero of="${DISK}" bs=10M count=5

echo "----- Preparing disk partitions"
(echo n; echo p; echo 1; echo ; echo ; echo w) | fdisk "${DISK}"
partx -u "${DISK}"

PART="${DISK}1"
echo "----- Creating a filesystem on ${PART}"
mkfs.ext2 "${PART}"

mkdir -p /mnt/usb
mount "${PART}" /mnt/usb
grub-install --root-directory=/mnt/usb "${DISK}"

echo "----- Download the initrd image"
mkdir "/mnt/usb/hdmedia-${DEBIAN_RELEASE}"
wget -O "/mnt/usb/hdmedia-${DEBIAN_RELEASE}/vmlinuz"   "${DEBIAN_MIRROR}/debian/dists/${DEBIAN_RELEASE}/main/installer-${ARCH}/current/images/hd-media/vmlinuz"
wget -O "/mnt/usb/hdmedia-${DEBIAN_RELEASE}/initrd.gz" "${DEBIAN_MIRROR}/debian/dists/${DEBIAN_RELEASE}/main/installer-${ARCH}/current/images/hd-media/initrd.gz"
mkdir -p /mnt/usb/isos
rsync -aP "${ISO}" /mnt/usb/isos

echo "----- Create grub config file"
cat << EOF > /mnt/usb/boot/grub/grub.cfg
set hdmedia="/hdmedia-${DEBIAN_RELEASE}"
set preseed="/hd-media/preseed"
set iso="/isos/${ISO_NAME}"
set timeout=15

menuentry "Debian ${DEBIAN_RELEASE} ${ARCH} AUTO install (HOME MEDIA SERVER) ${CURRENT_DATE}" {
  linux  \$hdmedia/vmlinuz iso-scan/filename=\$iso priority=critical auto=true preseed/file=\$preseed/debian.preseed
  initrd \$hdmedia/initrd.gz
}
menuentry "Debian ${DEBIAN_RELEASE} ${ARCH} MANUAL install (HOME MEDIA SERVER) ${CURRENT_DATE}" {
  linux  \$hdmedia/vmlinuz iso-scan/filename=\$iso priority=critical
  initrd \$hdmedia/initrd.gz
}
EOF

echo "----- Create preseed config file"

mkdir /mnt/usb/preseed
cat << EOF > /mnt/usb/preseed/debian.preseed
# locale
d-i debian-installer/locale           string   en_US
d-i keyboard-configuration/xkb-keymap select   us
d-i console-tools/archs               select   skip-config
d-i time/zone                         string   CA/Toronto
d-i clock-setup/utc                   boolean  true
d-i clock-setup/ntp                   boolean  true

# network
d-i hw-detect/load_firmware           boolean  true
d-i netcfg/enable                     boolean false
# d-i netcfg/hostname                   string  media

# user 
d-i passwd/root-password              password ${ROOT_PWD}
d-i passwd/root-password-again        password ${ROOT_PWD}
d-i passwd/make-user                  boolean  true
d-i passwd/user-fullname              string   SSH User
d-i passwd/username                   string   ${USER}
d-i passwd/user-password              password ${USER_PWD}
d-i passwd/user-password-again        password ${USER_PWD}

# USB and grub
# We assume the target computer has only one harddrive.
# In most case the USB Flash drive is attached on /dev/sda
# but sometimes the harddrive is detected before the USB flash drive and
# it is attached on /dev/sda and the USB flash drive on /dev/sdb
# You can set manually partman-auto/disk and grub-installer/bootdev or
# used the early_command option to automatically set the device to use.
d-i partman/early_command string \
    USBDEV=\$(mount | grep hd-media | cut -d" " -f1 | sed "s/\(.*\)./\1/");\
    BOOTDEV=\$(list-devices disk | grep -v \$USBDEV | head -1);\
    debconf-set partman-auto/disk \$BOOTDEV;\
    debconf-set grub-installer/bootdev \$BOOTDEV;
d-i grub-installer/only_debian   boolean true
d-i grub-installer/with_other_os boolean false

# Partioning remove all and make one for root
d-i partman-auto/method                          string  regular
d-i partman-lvm/device_remove_lvm                boolean true
d-i partman-lvm/confirm                          boolean true
d-i partman-lvm/confirm_nooverwrite              boolean true
d-i partman-auto/choose_recipe                   select atomic
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition                     select  finish
d-i partman/confirm                              boolean true
d-i partman/confirm_nooverwrite                  boolean true

## Controlling how partitions are mounted
d-i partman/mount_style    select uuid

# We don't want use a remote mirror (all stuff we need is on the USB flash drive)
d-i apt-setup/use_mirror   boolean false

# Install just openssh-server
tasksel tasksel/first multiselect standard
d-i pkgsel/include    string      openssh-server
d-i pkgsel/upgrade    select      none

# Execution after installation
# setup Network and sources list
# Network for VirtualBox
# echo "allow-hotplug enp0s3"     >> /target/etc/network/interfaces; \
# echo "iface enp0s3 inet dhcp"   >> /target/etc/network/interfaces; \
# echo "allow-hotplug enp0s8"     >> /target/etc/network/interfaces; \
# echo "iface enp0s8 inet dhcp"   >> /target/etc/network/interfaces; \

d-i preseed/late_command string \
echo "allow-hotplug enp0s1"       >> /target/etc/network/interfaces; \
echo "iface enp0s1 inet static"   >> /target/etc/network/interfaces; \
echo "address 192.168.1.10"       >> /target/etc/network/interfaces; \
echo "netmask 255.255.255.0"      >> /target/etc/network/interfaces; \
echo "gateway 192.168.1.1"        >> /target/etc/network/interfaces; \
echo "dns-nameservers 192.168.1.1 8.8.8.8"  >> /target/etc/network/interfaces; \
\
echo "media"  > /target/etc/hostname; \
\
echo "deb http://deb.debian.org/debian/ buster main"                            > /target/etc/apt/sources.list; \
echo "deb-src http://deb.debian.org/debian/ buster main"                       >> /target/etc/apt/sources.list; \
echo "deb http://security.debian.org/debian-security buster/updates main"      >> /target/etc/apt/sources.list; \
echo "deb-src http://security.debian.org/debian-security buster/updates main"  >> /target/etc/apt/sources.list; \
echo "deb http://deb.debian.org/debian/ buster-updates main"                   >> /target/etc/apt/sources.list; \
echo "deb-src http://deb.debian.org/debian/ buster-updates main"               >> /target/etc/apt/sources.list; \
\
echo "#!/usr/bin/bash" > /target/home/home-script.sh; \
echo "apt update; apt install -y git; git clone https://github.com/sv0505/home-server /home/home-server; cd /home/home-server; bash index.sh;"  >> /target/home/home-script.sh

d-i finish-install/reboot_in_progress note
EOF

sync
umount /mnt/usb

echo "Finished successfully!"
