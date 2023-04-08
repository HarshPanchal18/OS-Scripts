#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Monday 23 May 2022 05:24:29 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

tmpfile= "/tmp/available.$$"
trap "rm -f $tmpfile" EXIT

cat << 'EOF' > $tmpfile
    { sum += $4 }
END { mb = sum /1024
    gb=mb/1024
    printf "%.0f MB (.2f GB) of available disk space\n",mb,gb
}
EOF

df -k | awk -f $tmpfile
exit 0
