#!/bin/bash

echo "<Line> <Word> <Characters>"
echo
awk '{print $0, NF, length}' $1 #NF for words, length for Characters
echo

echo -n "Characters in $1: " && wc $1 | awk '{print $3}'
echo -n "Lines in $1: " && wc $1 | awk '{print $1}'
