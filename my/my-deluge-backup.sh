#!/bin/bash

# backup config
rm $SL-BACKUP/deluge/config.zip
zip -r1 $SL-BACKUP/deluge/config.zip /home/deluge/.config/*
