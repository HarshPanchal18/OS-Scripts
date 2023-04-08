#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 04 October 2022 11:53:35 AM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

read -p "Enter Number: " no

d=0;
cop=$no;
su=0;

while [ $no -gt 0 ]
do
    d=`expr $no % 10`;
    su=`expr $su \* 10 + $d`;
    no=`expr $no / 10`;
done

[ $su -eq $cop ] && echo "Palindrom" || echo "Not palindrom"
