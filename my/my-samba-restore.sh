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

echo "Set samba password for user for folder media. Enter User Name: "
read SAMBA_MEDIA_USER
smbpasswd -a $SAMBA_MEDIA_USER

echo -n "Add work user. Enter USER NAME: "
read SAMBA_WORK_USER
useradd -r -s /bin/false $SAMBA_WORK_USER
smbpasswd -a $SAMBA_WORK_USER


echo "Press Enter to continue..."
read
