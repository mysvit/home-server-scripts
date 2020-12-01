#!/bin/bash
source ./my/my-config.sh

# sync

echo ""
echo "***********************************  sync  **********************************************"
echo ""

rsync -arvn --delete-before /media/hdd-8T-1/ /media/hdd-8T-3/
