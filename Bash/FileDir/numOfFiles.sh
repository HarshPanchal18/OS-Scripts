#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Thursday 23 June 2022 10:51:07 AM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

if [ -d "$@" ]
then
    echo "Files found: $(find "$@" -type f | wc -l)"
    echo "Folders found: $(find "$@" -type d | wc -l)"
else
    echo "[ERROR] file not found"
fi

<<output
./fileNum.sh Downloads
Files found: 28
Folders found: 1
output
