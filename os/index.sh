#!/bin/bash
clear
echo "
0 Go back
1 Restart network
2 Interfaces
3 Hostname
"

echo -n "Enter number:"
read SELECT

if [ $SELECT -eq 0 ]
then
    echo "cd .."
else

case $SELECT in

  1)
    bash ./os/os-create-debian-10-usb-key.sh
    ;;

  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

echo "# run script again simulate goto to begin"
bash ./os/index.sh

fi
