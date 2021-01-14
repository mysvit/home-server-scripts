#!/bin/bash
clear
echo "
0 Go back

1 BACKUP ALL
2 INSTALL & RESTORE ALL
"

echo -n "Enter number : "
read COMMAND
[ $COMMAND -eq 0 ] && exit

case $COMMAND in

  1)
    bash ./my/my-backup-all.sh
    ;;
  2)
    bash ./my/my-restore-all.sh
    ;;
  *)
    echo "unknown selected option press ENTER to restart : "
    read
    ;;
esac

echo -n "Script finished. Press any key to continue : "
read
bash ./my/index.sh

