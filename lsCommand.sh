#!/bin/bash

# to capture a list of files into variable (Bash Array)
files=(*)

for file in "${files[@]}"; do # iterate over them
	echo "$file"
done
