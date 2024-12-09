#!/bin/bash

t=`date +%e`

if [ $t -lt 10 ]
then
    ncal -h | sed "s/$t/*/"
else
    ncal -h | sed "s/$t/**/"
fi

#Su  1  8 15 22 29   
#Mo  2 * 16 23 30   
#Tu  3 10 17 24 31   
#We  4 11 18 25      
#Th  5 12 19 26      
#Fr  6 13 20 27      
#Sa  7 14 21 28 
