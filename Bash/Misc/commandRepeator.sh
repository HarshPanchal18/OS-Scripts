#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Monday 25 July 2022 11:24:45 AM IST
# Author: Harsh Panchal

# Usage: ./repeator.sh [COMMNAD] [INTERVAL]
#------------------------------------------

while true
do
    eval $1
    sleep $2
    clear
done
