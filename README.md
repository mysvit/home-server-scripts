# Home server zero configuration scripts

Debian Server 10

Install git app and get home-server-scripts scripts and run index.sh

run unde root
su -

apt update;\
apt install -y git;\
git clone https://github.com/mysvit/home-server-scripts /home/home-server-scripts;\
cd /home/home-server-scripts;\
bash index.sh;
