#!/bin/bash

calc='2 * 3'

echo $calc
echo "$calc"
echo $(($calc))


a='var'
echo '$a' # prints '$a'
echo "$a" # prints var

l1='
'

l2="
"

l3=$'\n'
empty=\

echo "Line${l1} break"
echo "Line${l2} break"
echo "Line${l3} break"
echo "No line break${empty} here"

echo $'Slash: [\\]'
echo $'Tab again [\009]'
echo $'Form Feed: [\f]'
echo $'Line\nBreak'
