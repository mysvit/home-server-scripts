#!/bin/bash

echo ##########################################################
echo ####################### BACKUP ###########################

##### NETWORK #####
f="/etc/network/interfaces"
echo $f
if [ !-e $f ]
then
  cp $f $f.bak
fi

##### NETWORK #####
