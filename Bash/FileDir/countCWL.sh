#!/bin/bash

#------------------------------------------
# Purpose: Count Lines, Words and Characters without `wc` command
# Created Date:  Tuesday 30 August 2022 07:37:23 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage: ./countCWL.sh [file]
#------------------------------------------
w=($(awk '{print NF }' $1))
c=($(awk '{print length }' $1))

line=0; while read -r LINE; do (( line++ )); done < $1
echo Lines: $line

for i in ${w[@]}; do sum=`expr $sum + $i`; done
echo Words: $sum

for i in ${c[@]};do sum=`expr $sum + $i`; done
echo Characters: $sum
