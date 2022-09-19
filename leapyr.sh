#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Sunday 05 June 2022 02:18:45 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

if [ $# -ne 0 ]; then
    # echo "input is given"

    # checking if argument is one or greater than one
    if [[ $# -eq 1 ]]; then
        # echo "output is one"

        # checking if the input is number or alpha or a floating point
        if [[ "$1" =~ ^[0-9]+$ ]]; then
            # echo "It is a number

            # check if the number is divible by 400
            if [[ $(( $1 % 400 )) != 0 ]]; then

        # check if the number is divible by 4
        if [[ $(( $1 % 4 )) == 0 ]]; then

          # check if number is divisible by 100
          if [[ $(( $1 % 100 )) == 0 ]]; then
            echo "false"
          else
            echo "true"
          fi

        else
          echo "false"
        fi

      else
        echo "true"
      fi

    else
      echo "Usage: leap.sh <year>"
      exit 1
    fi

else
    echo "Usage: leap.sh <year>"
    exit 1
    fi
else
    echo "Usage: leap.sh <year>"
    exit 1
fi

## Pseudocode

## No input should return an error'
##  if $# > 1 -> error
##    if aplha --> error
##      if float --> return an error

## We would take a reverse approach here
# and check if the number is divisible by 400
# because then it would be divisible by 100 and 4 as well
# satisfying the above two conditions as well

# then check if number is divisible by 4
# if yes -- check if number is divisible by 100
  # if yes -> return false
  # if no -> return true
# if No -> return false
