#!/bin/bash
source ./my/my-config.sh

# install caddy

bash ./app/app-caddy.sh

echo ""
echo "***********************************  add Caddyfile  **********************************************"
echo ""

cat << EOF > /etc/caddy/Caddyfile
:80
# Set this path to your site's directory.
root * /mysvit/web/stmichael/www
# Enable the static file server.
file_server
# Rewrites the request URI path
try_files {path} /index.html
# Enable log
log {
	output file /var/log/caddy/access.log
	level DEBUG
}
EOF
