#!/bin/bash

# up interfaces
array_i=()
for iface in $(ip link list | cut -d ' ' -f2| tr ':' '\n' | awk NF)
do
  if [ "$iface" != "lo" ] 
  then
    array_test+=("$iface")
  fi  
done

echo -n "Wait untill finished [systemctl restart networking] and [ifup "
for i in "${array_test[@]}"; do 
  echo -n "$i; "; 
done
echo "]"

# restart network
systemctl restart networking

for i in "${array_test[@]}"; do 
  echo "====== $i ======="; 
  ifup $i
done

echo
echo "Press ENTER to continue"
read
