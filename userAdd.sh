#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 08 June 2022 03:02:05 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

if [ $(id -u) -eq 0 ]
then
    read -p "Enter username : " username
    read -s -p "Enter password : " password
    egrep "^$username" /etc/passwd > /dev/null
    if [ $? -eq 0 ]
    then
        echo "$username exists!"
        exit 1
    else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password )
        usersdd -m -p $pass $username
        [ $? -eq 0 ]; then echo "Operation Successful" || echo "Error"
    fi
else
    echo "Only root may add a user to the system"
    exit 2
fi
