#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 26 July 2022 11:21:59 AM IST
# © Author: Harsh Panchal

# Usage:
#------------------------------------------

FILE="home-listing-$(date +%s).txt"

#tree -R ~ > FILE
ls -R ~ > FILE

# gzip will name compressed output file to $FILE.gz
gzip $FILE
read -p 'Please instert your USB flash drive SIR! (and then press ENTER) > ' ENTER

mount /dev/disk/by-label/backupdisk /media/my-backup-usb && if { df -h | grep /media/my-backup-usb ; }
then
    cp $FILE.gz /media/my-backup-usb && umount /media/my-backup-usb
    read -p 'Please REMOVE your USB flash drive Sir (and press Enter again) > ' ENTER
else
    echo "Disk not mounted, better fix that somehow..."
fi
