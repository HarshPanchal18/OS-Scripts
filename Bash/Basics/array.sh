#!/bin/bash

arr=(`seq 1 10`)

echo ${arr[@]}

echo ${arr[-1]} # last element

echo ${arr[@]: -1} # last element

echo "${arr[*]}"

echo ${arr[@]:1} # print from 1st index

echo ${arr[@]:1:3} # print 3 element from index 1


arra=(zero one two)

echo ${arra[@]:1} # prints->  one two

echo ${arra[@]:0:2} #prints -> zero one

echo ${arra[0]:0:2} #prints 0 to 2 index of first element here. ze

arra+=(three)

echo ${arra[@]} # appends to the array, prints -> zero one two three

arra=("${arra[@]}" four five) # appends as argument

echo ${arra[@]} # prints -> zero one two three four five

arra=(minusOne "${arra[@]}")  # appends to the start

echo ${arra[@]} # minusOne zero one two three four five



i=3

arra=("${arra[@]:0:$i}" onehalf "${arra[@]:$i}") # appends at 'i'th index

echo ${arra[@]}

echo ${!arra[@]} # prints index(s)

unset -v 'arra[0]' # removes 0th index & value both

echo ${arra[@]} # zero one onehalf two three four five

echo ${!arra[@]} # 1 2 3 4 5 6 7

array=("${arr[@]}" "${arra[@]}") # merging to the new one

echo ${array[@]} # 1 2 3 4 5 6 7 8 9 10 zero one onehalf two three four five

echo ${#array[@]} # returns array length (17)




declare -A aa

aa=([hello]=world [ab]=cd ["key space"]="hii linux")

echo ${aa[@]} # cd world hii linux

echo ${aa[ab]} # cd

for key in "${!aa[@]}";
do
        echo "key: $key"
        echo "value: ${aa[$key]}"
done

<<op
key: ab
value: cd
key: hello
value: world
key: key space
value: hii linux
op

stringVar="Apple Banana Orange Mango"

echo ${stringVar[@]} # Apple Banana Orange Mango

arrayVar=(${stringVar// / })

echo ${arrayVar[1]} # Banana

unset arrayVar
unset stringVar


stringVar="Apple+Banana+Orange+Mango"

arrayVar=(${stringVar//+/ }) # replace + with blank-space

echo ${stringVar[@]} # Apple+Banana+Orange+Mango
echo ${arrayVar[@]}  # Apple Banana Orange Mango

insert(){
        h='
#######################################
# Usage: insert element at index
# parameters:
#       arrName
#       index
#       value
######################################
        ' 
        [[ $1 = -h ]] && { echo "$h" > /dev/stderr; return 1; }
        declare -n __arr__=$1
        i=$2
        el="$3"

        [[ ! "$i" =~ ^[0-9]+$  ]] && { echo "Index must be a valid integer" >/dev/stderr; return 1;}

        (( $1 < 0 )) && { echo "index must be positive integer" >dev/stderr; return 1;}

        __arr__=( "${__arr__[@]:0:$i}" "$el" "${__arr__[@]:$i}" )
}

arr=(a b c d)

echo ${ar[2]} # c

insert arr 2 'bc'

echo ${arr[@]} # a b bc c d
