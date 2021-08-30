#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

bash /home/home-server-scripts/app/app-samba.sh

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

# add sync to crontab
echo "add sync to crontab"

echo "#!/bin/sh
/home/home-server-scripts/my/my-samba-backup.sh" > /etc/cron.daily/my-samba-backup
chmod 755 /etc/cron.daily/my-samba-backup

echo ""
echo "***********************************  restore SAMBA completed **********************************************"
echo ""

bash "${MYSVIT_BACKUP}/samba/samba_pwd.sh"

echo "Press Enter to continue..."
read
