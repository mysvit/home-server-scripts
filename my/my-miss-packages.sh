#!/bin/bash
echo ""
echo "***********************************   add miss packages   ***************************************"
apt install apt-rdepends
apt-rdepends -r wget apt-transport-https ca-certificates curl gnupg2
apt-rdepends -r jellyfin
echo "Press Enter to continue..."
read
echo ""
echo "***********************************   add miss packages   ***************************************"
echo " JELLYFIN "
apt install wget
wget http://ftp.ca.debian.org/debian/pool/main/g/gnupg2/gpgv_2.2.12-1+deb10u1_amd64.deb
dpkg -i gpgv_2.2.12-1+deb10u1_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/n/numactl/libnuma1_2.0.12-1+b1_amd64.deb
dpkg -i libnuma1_2.0.12-1+b1_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/libv/libvpx/libvpx6_1.9.0-1_amd64.deb
dpkg -i libvpx6_1.9.0-1_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/x/x264/libx264-160_0.160.3011+gitcde9a93-2.1_amd64.deb
dpkg -i libx264-160_0.160.3011+gitcde9a93-2.1_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/x/x265/libx265-192_3.4-2_amd64.deb
dpkg -i libx265-192_3.4-2_amd64.deb
echo " JELLYFIN "

echo " MKVTOOLNIX "
wget http://ftp.ca.debian.org/debian/pool/main/libd/libdvdread/libdvdread8_6.1.1-2_amd64.deb
dpkg -i libdvdread8_6.1.1-2_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/f/fmtlib/libfmt7_7.1.3+ds1-5_amd64.deb
dpkg -i libfmt7_7.1.3+ds1-5_amd64.deb

wget http://ftp.ca.debian.org/debian/pool/main/d/double-conversion/libdouble-conversion3_3.1.5-6.1_amd64.deb
dpkg -i libdouble-conversion3_3.1.5-6.1_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/i/icu/libicu67_67.1-7_amd64.deb
dpkg -i libicu67_67.1-7_amd64.deb
wget http://ftp.ca.debian.org/debian/pool/main/p/pcre2/libpcre2-16-0_10.36-2_amd64.deb
dpkg -i libpcre2-16-0_10.36-2_amd64.deb

wget http://ftp.ca.debian.org/debian/pool/main/q/qtbase-opensource-src/libqt5core5a_5.15.2+dfsg-9_amd64.deb
dpkg -i libqt5core5a_5.15.2+dfsg-9_amd64.deb

echo " MKVTOOLNIX "

echo "Press Enter to continue..."
read
