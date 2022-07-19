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
