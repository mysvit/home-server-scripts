
#!/bin/bash
source /home/home-server-scripts/my/my-config.sh

# make foledr if not exist
if [ ! -d "${MYSVIT_BACKUP}/samba" ]
then
  mkdir "${MYSVIT_BACKUP}/samba"
fi

# backup config
if [ -f "${MYSVIT_BACKUP}/samba/smb.zip" ]
then
  rm "${MYSVIT_BACKUP}/samba/smb.zip"
fi

zip -r1 "$MYSVIT_BACKUP/samba/smb.zip" /etc/samba/*
