#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 30 August 2022 09:25:30 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

<<com
read -rp "Who are we checking on? "
if w -h | grep -q "^$REPLY "; then
    echo "here's what "$REPLY" is doing:"
    top -u "$REPLY"
else
    echo "looks like "$REPLY" is not logged in."
fi
com

<<comm
read -p "Who are you? " user &&
    ((    # prompt for username, save as $user
    who -u | grep -q "^$user "   &&       # test if user is logged in
    top -u "$user"                  ) || # run top with that username
    echo "$user is not logged in"
        ))     # error message
comm

read -p "Enter Username: " check
user="$(id -u -n)"

[ "$check" = "$user" ]  &&  echo "$check Is Logged In"  ||  echo "$check Is Not Logged In"
