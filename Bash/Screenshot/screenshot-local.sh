#!/bin/sh

#------------------------------------------
# Purpose:
# Created Date:  Saturday 09 July 2022 10:20:44 AM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

path=~/root/Pictures/$(date +'%s').png

# and a lighter border, here
maim -s -c 1,0.5,0.2,1.0 "$path"

if [ -e $path ]
then
    notify-send "Local screenshot saved"
fi
