#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

bash ./app/app-samba.sh

echo ""
echo "***********************************  restore SAMBA from backup *****************************************"
echo ""

echo "Wait 10s. and Press Enter"
read

if [ -f "${MYSVIT_BACKUP}/samba/samba.zip" ]
then
  systemctl stop smbd

  unzip -o "${MYSVIT_BACKUP}/samba/samba.zip" -d /

  systemctl start smbd
fi

echo '0 2 * * * bash -c "source /home/home-server-scripts/my/my-config.sh; /home/home-server-scripts/my/my-samba-backup.sh"' >> "${CRONTAB_ROOT}"

echo ""
echo "***********************************  restore SAMBA completed **********************************************"
echo ""

echo "Press Enter to continue..."
read
