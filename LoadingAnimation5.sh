#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Friday 22 July 2022 10:55:56 AM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

symbols=('-' '\' '|' '/')

while true; do
        for symbol in "${symbols[@]}"; do
                printf "\r %c " "$symbol"
                sleep .075
        done
done
