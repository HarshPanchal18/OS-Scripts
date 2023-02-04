#!/bin/bash

printf "Hii\n"

vari="Hello"

echo "hiii " "$vari" "$1" "$2"

echo "hi $vari"

<<comm
Output:

Hii
hiii  Hello harsh panchal
hi Hello

comm
