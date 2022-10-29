#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Monday 11 July 2022 07:47:57 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

if [ "$1" == "" ]; then echo "specify file"; exit 0; fi

d1=$(date +%s) #Current date
d2=$(date +%s -r "$1") #File Creation date
echo $(( (d1-d2) / 86400 )) days
