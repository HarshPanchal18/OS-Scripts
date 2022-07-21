#!/bin/bash

#UPPER...

v="hello"

printf '%s\n' "${v^}" # make first characeter UPPER

# ',' for lower
# '~' for toggle

printf '%s\n' "${v^^}" # make whole string to UPPER

#ALTERNATIVE

v="hello world"

declare -u string=$v # -l for lower

echo $string


set -- 1 2 3 4
echo ${#@}
echo $#

a="i am a string"

echo ${a/a/A} # replace on first match

echo ${a//a/A} # replace to the whole

echo ${a/#i/N} # replace the first

echo ${a/%g/N} # replace the last element

echo ${a/%g/} # replace woth nothing

a=(hello world)

echo ${a[@]/#/R} # add prefix (here 'R') to the element

#delete a pattern from the beginning of a string

#shortest match
a='I am a string'
echo ${a#*a} # m a string
#longest match
echo ${a##*a} # string (as it deletes till last match)

# '#' deletes from the beginning
# '%' deletes from the end (Reverse Order)
var="Apple Orange"
echo ${var%% *} # Apple
echo ${var%%*} # <blank>
echo ${var%% * } # Apple Orange
echo ${var##* } # Orange (Last element)
echo ${var## *} # Apple Orange
echo ${var## * } # Apple Orange

var="Apple Grape Orange"
echo "${var% *}" #Apple Grape
echo "${var#* }" #Grape Orange

#parameter indirection

red="Red"
green="Green"

color=red
echo "${!color}"

color=green
echo "${!color}"

foo=10
x=foo

echo $x # foo

echo ${!x} #10, indirect expansion
