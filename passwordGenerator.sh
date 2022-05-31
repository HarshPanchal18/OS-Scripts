#!/bin/bash

#Simple password generator

echo "This is a simple password generator"

echo "Please enter the length of the password: "
read PASS_LEN

echo "Enter the number of password"
read numPass

echo "Generated password(s):"

for p in $(seq 1 $numPass); # make $(seq 1 5) to generate 5 passwords or you can read from user
do
#    openssl rand -base64 48 | cut -c1-$PASS_LEN # generate in base64 format and cut character to the PASS_LEN
    openssl rand -hex 48 | cut -c1-$PASS_LEN # generate in hexadecimal format
done

<<flags
Usage: rand [flags] num
Valid options are:
 -help               Display this summary
 -out outfile        Output file
 -rand val           Load the file(s) into the random number generator
 -writerand outfile  Write random data to the specified file
 -base64             Base64 encode output
 -hex                Hex encode output
 -engine val         Use engine, possibly a hardware device
flags


<<output
This is a simple password generator
Please enter the length of the password: 
8
Enter the number of password
4
Generated password(s):
dbe7903a
40b71102
fce7964f
cf6026b8

output
