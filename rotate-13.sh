#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Saturday 18 June 2022 03:16:59 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

if [ "$#" -eq 0 ]
then
    tr 'A-Za-z' 'N-ZA-Mn-za-m'
else
    echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
fi
