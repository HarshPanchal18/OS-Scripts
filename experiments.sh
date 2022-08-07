#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Sunday 24 July 2022 03:53:57 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

set `date`
echo "Count $#"
echo "$1 $2 $3 $4 $5"
shift 2
echo "$1 $2 $3 $4 $5"

# Log arguments with timestamp to stdout.
echo $(date +%d-%m-%y_%H-%M-%S): $*

# Log each argument with timestamp to stdout on a separate line.

for arg in "$@"; do
    echo $(date +%d-%m-%y_%H-%M-%S): $arg
done

#Remove blank lines from input
grep -V '^[[:space:]]*$'

# Generate a "unique" 6-digit hexadecimal identifier.
uuidgen -r | cut -c -6
