# Home media server zero configuration scripts Debian Server 11

1 My Scripts (mount usb, make work forlders) - you should modify files from that folder for yourself
    1 BACKUP ALL
    2 INSTALL & RESTORE ALL
2 Network
    1 Restart network
    2 Add Interface
    3 Add Hostname
    4 Add Samba share
    5 Disable ipv6
3 Disk & USB
    1 List hdd and usb devices (fdisk -l)
    2 Mount on startup usb disk
    3 Instruction how to create and format to ext4
    91 Install support ntfs
4 Samba
    1 Install Samba
    2 Connect to samba share
    3 Mount samba share and add to StartUp
5 Install Applications
    1  - Install JELLYFIN - media server - server_ip:8096
    2  - Install DELUGE - torrent client with web ui - server_ip:8112 (default password: deluge)
    3  - Install SAMBA - windows file share
    91 - mc : Midnight commander - file manager
    92 - ffmpeg & mkvtoolnix : video tools
    93 - caddy: platform for server app with https
    94 - youtube-dl
6 Install server on USB
    1 Create Debian Server 11 usb key with auto install


Install git app and get home-server-scripts scripts and run index.sh

run unde root\

apt update;\
apt install -y git;\
git clone https://github.com/mysvit/home-server-scripts /home/home-server-scripts;\
cd /home/home-server-scripts;\
bash index.sh;
