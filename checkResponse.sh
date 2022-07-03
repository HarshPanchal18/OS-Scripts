#!/bin/bash

#------------------------------------------
# Purpose: An easy way to check the server response speed via terminal
# Created Date:  Wednesday 22 June 2022 11:20:35 AM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

if [ -z "$1" ]
then
    echo "Usage checkResponse google.com" 
else
    curl -so /dev/null -w "Connect: %{time_connect} \nTTFB: %{time_starttransfer} \nTotal time: %{time_total} \n" "$1"
fi

<<output
Connect: 0.190535 
TTFB: 0.293202 
Total time: 0.293251 
output
