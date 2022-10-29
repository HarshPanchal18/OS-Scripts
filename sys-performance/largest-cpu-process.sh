#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Thursday 18 August 2022 10:12:29 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

output=$(ps -exco pcpu,comm | sort -k 1 -n -r | head -n 1)
perc=$(echo -e "$output" | awk -F " " '{st =index($0," ");print $1}')

# Using awk like in largest-ram-consumer doesn't work, so do this instead.
cmd=${output/$perc/}

# Remove leading whitespace...?
cmd=$(echo "$cmd" | awk '{$1=$1};1')

echo "${cmd} - ${perc}%"
