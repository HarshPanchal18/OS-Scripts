#!/bin/bash

#------------------------------------------
# Purpose: Generates a .gitignore file via https://gitignore.io
# Created Date:  Saturday 07 January 2023 06:17:38 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

params="$1"

if [[ -z "$params" ]];then
    echo "Missing params"
    exit 1
fi

result=$(curl -s "https://www.toptal.com/developers/gitignore/api/$params" | sed -e "1d")

if [[ "$result" =~ !!\ ERROR.+!! ]];then
    echo "Unsupported gitignore type"
    exit 1
fi

echo "$result" | pbcopy

echo "Copied to clipboard!"
