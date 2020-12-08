#!/bin/bash
source ./my/my-config.sh

# install caddy

bash ./app/app-caddy.sh

echo ""
echo "***********************************  add Caddyfile  **********************************************"
echo ""

caddy stop
cat << EOF > /etc/caddy/Caddyfile

#:80
#:443
[nds-name] {
        root * [WEB_CONTENT_FOLDER]
        file_server
        try_files {path} /index.html

        log {
                output file [path_to_].access.log
                level info
        }

}

[nds-name] {
        reverse_proxy 127.0.0.1:8096

        log {
                output file [path_to_].access.log
                level info
        }
}
EOF
caddy start
