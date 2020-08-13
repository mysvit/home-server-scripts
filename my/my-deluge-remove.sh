#!/bin/bash
source ./my/my-config.sh

# backup config before uninstall
bash ./my/my-deluge-backup.sh
# remove backup from crontab
#TODO - now cron inside "root" file need to check why doesn't start backup under deluge user
# rm "${CRONTAB_DIR}/deluge"
# remove deluge
bash ./app/app-deluge-remove.sh
