#!/bin/bash

#Method 1
tac "$1"
echo

#Method 2
nl "$1" | sort -nr | cut -f 2-
echo

#Method 3
sed -n '1{h;T;};G;h;$p;' "$1"
echo

#Method 4
awk '{a[i++]=$0}END{for(j=i-1;j>=0;j--)print a[j];}' "$1"
echo

#Method 5
perl -ne 'push @arr,$_;}{print reverse @arr;' "$1"
echo

#Method 6
perl -ne 'push @arr,$_;}{while(@arr){ print pop @arr;}' "$1"
echo
