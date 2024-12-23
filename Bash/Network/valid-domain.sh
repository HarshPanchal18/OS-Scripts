#!/bin/bash

#------------------------------------------
# Purpose: Script to do nslookup on all domain mentioned a file
# Check whether they are resolved (works) or not (not working)
# And print in two differnt files of working and not working

# Created Date:  Sunday 05 June 2022 02:30:00 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

# File path name where all domains are stored
FilePath="/home/domain-names"

# emptying the working-domains.txt and not-working-domains.txt file for a fresh output everytime
> not-working-domains.txt
> working-domains.txt

# Putting a for loop to run throught all domains mentioned in a file
# Reading all domains in file name
for x in `cat $FilePath`
do
    # printing all domain names along with the output of nslookup status
    # With the breaker after every domain
    Resolve=`nslookup $x | grep NXDOMAIN | wc -l`
    if [[ $Resolve -eq  1 ]]
    then
        echo "$x" >> not-working-domains.txt
    else
        echo "$x" >> working-domains.txt
    fi
done

## Logic
# nslookup gives NXDOMAIN as a result if the domain isn't valid
# doing nslookup on all domains, inside a for loop and grep for NXDOMAIN
# then rechecking it with wc -l
# if the count comes to 1 (because NXDOMAIN will be present in output)
# putting that domain in not-working-domains.txt
# rest all in working working-domains.txt


## Things to make the script better
# Instead of defining path name in file, use it as command line argument 1
# $1 -> so that the suer doesn't have to always go and edit the script manually.
