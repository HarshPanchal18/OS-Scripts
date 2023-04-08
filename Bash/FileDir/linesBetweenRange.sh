#!/bin/bash

file="$1"
beg="$2"
end="$3"

head -"$end" "$file" | tail +"$beg"
