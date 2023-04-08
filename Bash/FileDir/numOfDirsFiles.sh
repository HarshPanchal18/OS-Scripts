#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Tuesday 30 August 2022 07:30:02 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

echo Files: $(ls | wc -l)

echo Directories: $(tree | tail -n 1|awk '{print $1}')
