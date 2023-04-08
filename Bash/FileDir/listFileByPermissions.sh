#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 30 August 2022 06:48:51 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage: ./listFileByPermissions.sh [path]
#------------------------------------------

#find -type d \( \( -user root -perm /u=w \) -o \( -group root -perm /g=w \) -o -perm /o=w \)
<<comm
sudo find / -type d -user rinzwind -perm /u=w
sudo find / -type d -group rinzwind -perm /g=w
sudo find / -type d -perm /o=w
comm

echo "Executables:"
for p;
do
    [ -x "$p" ] && echo "$p"
done
echo
echo "Writables:"
for p;
do
    [ -w "$p" ] && echo "$p"
done
echo
echo "Readables:"
for p;
do
    [ -r "$p" ] && echo "$p"
done
#    [ -r "$p" ] && echo "$p"
#    [ -x "$p" ] && echo "$p"
