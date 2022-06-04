#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Tuesday 24 May 2022 10:51:18 AM IST
# Author: Harsh Panchal

# Usage: Dowload website using wget
#------------------------------------------

# @param $1 - Url of the website

download(){
    wget -E -H -k -K -p "$1"
}

main(){
    
    # Regex for URL check
    regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

    url=$(dialog --inputbox "Enter the URL of website you wish to download: \
            Example: http://HarshPanchal18.github.io" 10 50 --output-fd 1)

    #check URL with regex

    if [[ $url =~ $regex ]]
    then
        echo "Link Valid"
        download "$url"
    else
        echo "Link Not Valid"
        exit 1
    fi
}

main "$@"

exit 0
