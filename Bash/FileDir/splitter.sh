#!/bin/bash

#------------------------------------------
# Purpose: To split files of a folder in multiple directories
# Created Date:  Friday 05 August 2022 09:43:49 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

if [[ $# -eq 0 ]]
then
    echo "Usage: ftest dir_name dir_size"
    echo " Splitting the folder, Please wait ... "
else
    echo "dirname is $1 and dirsize is $2"

    dir_size=$2
    dir_name="$1"
    n=$((`find . -maxdepth 1 -type f | wc -l`/$dir_size+1))
    
    for i in `seq 1 $n`;
    do
        mkdir -p "$dir_name$i";
        find . -maxdepth 1 -type f | head -n $dir_size | xargs -i mv "{}" "$dir_name$i"
    done
fi
