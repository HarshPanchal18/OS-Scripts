#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Monday 13 June 2022 02:10:25 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

# Needs sudo access, kills process at specified port or
# at port 8080 if no port specified

port=$1

if [ $# -lt 1 ]
then
    port=8080
fi

echo ${port}

process="$(sudo netstat -nlp | grep :${port})"

id="$(awk '{sub (/\/[a-zA-Z]*/, "", $7); print $7}' <<< ${process})"

sudo kill -9 ${id}

echo "Process running at ${port} is killed properly"
