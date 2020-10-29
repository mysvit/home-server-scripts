#!/bin/bash
clear
echo "
0 Go back

1 Restart network
2 Add Interface
3 Add Hostname
4 Add Samba share
5 Disable ipv6
"

echo -n "Enter number:"
read SELECT

if [ $SELECT -eq 0 ]
then
    echo "cd .."
else

case $SELECT in

  1)
    bash ./network/network-restart.sh
    ;;
  2)
    bash ./network/network-interfaces.sh
    ;;
  3)
    bash ./network/network-hostname.sh
    ;;
  4)
    bash ./network/network-samba.sh
    ;;
  5)
    bash ./network/disable-ipv6.sh
    ;;
  *)
    echo "unknown option pres ENTER to restart : "
    read
    ;;
esac

echo "# run script again simulate goto to begin"
bash ./network/index.sh

fi
