#!/bin/bash
clear 
echo "
0 Go back

1 Install Samba
2 Connect to samba share
3 Mount samba share and add to StartUp"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $COMMAND in
  1)
    bash ./samba/samba-install.sh
    ;;
  2)
    bash ./samba/samba-connect.sh
    ;;
  3)
    bash ./samba/samba-mount.sh
    ;;
  *)
    echo "unknown option pres ENTER to restart"
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./samba/index.sh
