#!/bin/bash

echo "Wait untill finished [systemctl restart networking] and [ifup *]"

# restart network
systemctl restart networking

# up interfaces
array_i=()
for iface in $(ip link list | cut -d ' ' -f2| tr ':' '\n' | awk NF)
do
  printf "$iface\n"
  if [ "$iface" != "lo" ] 
  then
    array_test+=("$iface")
  fi  
done

for i in "${array_test[@]}"; do 
  echo "$i"; 
  ifup $i
done

echo "Press ENTER to continue"
read
