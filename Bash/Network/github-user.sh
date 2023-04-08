#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 25 May 2022 05:16:16 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

if [ $# -ne 1 ]
then
    echo "Usage: $0 <username>"
    exit 1
fi

curl -s "https://api.github.com/users/$1" | \
  awk -F'"' '
    /\"name\":/ {
    print $4" is the name of the GitHub user."
    }
    /\"location\":/{
    print $4" is the users location."
    }
    /\"bio\":/{
    print $4" is written in the users bio."
    }
    /\"followers\":/{
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "The user has "a[2]" followers."
    }
    /\"following\":/{
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "The user is following "a[2]" other users."
    }
    /\"public_repos\":/{
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "The user has "a[2]" public repositories."
    }
    /\"public_gists\":/{
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "The user has "a[2]" public gists."
    }
    /\"created_at\":/{
    print "The account was created on "$4"."
    }
  '

exit 0
