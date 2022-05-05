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
