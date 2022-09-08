#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 30 August 2022 07:10:03 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage: ./fileIdentity.sh file1 file2
#------------------------------------------

[ cmp -s $1 $2 ] && echo "The files match" ||  echo "The files are different"
