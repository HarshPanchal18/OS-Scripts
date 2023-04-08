#!/bin/bash

# exit if any statement returns false value (can't use $? from now on)
set -o errexit

# exit if variable is not set
set -o nounset

# uncomment to debug
#set -x

if [[ `sysclient -l | grep TouchpadOff | awk '{print $3}'` -eq 1 ]];then
    sysclient TouchpadOff=0;
else
    sysclient TouchpadOff=1;
fi
