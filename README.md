# Home server zero configuration scripts

Install git app and get home-server-scripts scripts and run index.sh

su -

apt update;\
apt install -y git;
git clone https://github.com/mysvit/home-server-scripts /home/home-server-scripts;
cd /home/home-server-scripts;
bash index.sh;
