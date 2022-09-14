#!/bin/bash

#------------------------------------------
# Purpose: Regularly check whether provided PID is currently running.
# Created Date:  Sunday 31 July 2022 06:03:24 PM IST
# © Author: Harsh Panchal

# Usage:
#------------------------------------------

pid=${1:-1}
interval=${2:-1}

while true
do
    if [[ -d /proc/$pid ]]
    then
        printf "[%s] Process with PID %d is running. " "$(date)" "$pid"
    else
        printf "[%s] Process with PID %d is not running. " "$(date)" "$pid"
    fi
    # erase previous output line, leaving the cursor on the same line
    printf "\r"
    sleep $interval
done
