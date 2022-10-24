#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 27 July 2022 11:20:13 AM IST
# © Author: Harsh Panchal

# Usage:
#------------------------------------------

# Print out 5 (pseudo)random lottery numbers from 1-50.

nums=( $(seq 50| shuf | head -5) )

[[ $1 == -s ]] && printf "Lotto Numbers (%s)\n%s\n" "$date" "${nums[*]}" > /tmp/lotto-numbers.txt || echo ${nums[*]}
