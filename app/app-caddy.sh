#!/bin/bash

# Install Caddy 2
echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" | tee -a /etc/apt/sources.list.d/caddy-fury.list
apt update

echo
echo Caddy 2
echo 
apt install caddy -y

echo ""
echo "***********************************  add Caddyfile  **********************************************"
echo ""

#cat << EOF > /etc/caddy/Caddyfile

cat << EOF

#:80
#:443
# WEB SERVER
[nds-name] {
        root * [WEB_CONTENT_FOLDER]
        file_server
        try_files {path} /index.html

        log {
                output file [path_to_].access.log
                level info
        }

}

# REVERSE PROXY
[nds-name] {
        reverse_proxy 127.0.0.1:8096

        log {
                output file [path_to_].access.log
                level info
        }
}
EOF
