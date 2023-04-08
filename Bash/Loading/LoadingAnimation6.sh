#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Friday 22 July 2022 11:02:06 AM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

i=1
sp="/-\|"
echo -n ' '
while true
do
    printf "\b${sp:i++%${#sp}:1}"
done
