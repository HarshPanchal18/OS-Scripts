#!/bin/bash

calc='2 * 3'

echo $calc 
# prints 2, files of current directory, 3

echo "$calc" # 2 * 3

echo $(($calc)) # 6


a='var'
echo '$a' # '$a'

echo "$a" # var

l1='
'

l2="
"

l3=$'\n'
empty=\

echo "Line${l1} break"
#Line
# break

echo "Line${l2} break"
#Line
# break

echo "Line${l3} break"
#Line
# break

echo "No line break${empty} here" #No line break here


echo $'Slash: [\\]' # Slash: [\]

echo $'Tab again [\009]' # Tab again [

echo $'Form Feed: [\f]'
#Form Feed: [
              ]
              
echo $'Line\nBreak'
#Line
#Break
