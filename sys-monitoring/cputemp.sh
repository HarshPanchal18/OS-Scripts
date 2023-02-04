#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Sunday 10 July 2022 01:49:39 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

temp=$((`sensors | grep "Physical id 0" | cut -d'+' -f2 | head -c2`))
output="temp: $temp°"
echo $output
