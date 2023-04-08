#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Saturday 16 July 2022 06:28:46 PM IST
# Author: Harsh Panchal

# Usage: ./gotoline.sh [line] [file]
#------------------------------------------

input="$2"
#touch "$3"
count=0

while IFS= read -r var
do
    if [ "$count" -ge "$1" ];then
        break
    fi
    echo $var
    count=$((count+1))
done < "$2"
