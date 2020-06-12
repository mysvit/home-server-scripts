#!/bin/bash

source ./my/my-config.sh

bash ./my/my-backup.sh

# remove backup from crontab
rm "${CRONTAB_DIR}\deluge"

bash ./my/my-backup.sh
bash ./app/app-deluge-uninstall.sh
