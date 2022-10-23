#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Saturday 13 August 2022 11:53:34 AM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

function chk(){
    if [[ $1 -gt $2 ]]
    then
        echo High
    elif [[ $1 -lt $2 ]]
    then
        echo Low
    else
        echo "Congratulations, you got it right"
    fi
}

while [[ 1 -gt 0 ]]
do
    echo "Enter a number: "
    read n
    if [[ $n =~ ^[0-9]*$ ]];then
        t=$(ls -la | egrep -c '^-' )
        chk $n $t
        if [[ $n -eq $t ]]; then
            break
        fi
    else
        echo "Please enter only integer"
    fi
done
