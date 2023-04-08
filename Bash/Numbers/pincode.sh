#!/bin/bash

#------------------------------------------
# Purpose: Check validity of pincode
# Created Date:  Monday 04 July 2022 11:40:40 AM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

pincode=421069

regex="^[0-9]{6}$"

[[ $pincode =~ $regex ]] && echo "Valid" ||  echo "Invalid"
