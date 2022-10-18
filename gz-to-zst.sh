#!/bin/bash

#------------------------------------------
# Purpose: Convert given `*.gz` files into `*.zst` files (at `-9`), and show statistics

# Created Date:  Tuesday 16 October 2022 11:21:59 AM IST
# © Author: Harsh Panchal

# Usage:
# - `gz-to-zst foo.gz`
# - `gz-to-zst *.gz`
#------------------------------------------


if [[ -z "$1" ]]; then
    >&2 echo 'Usage: gz-to-zst FILE [FILE, ]'
    exit 1
fi

for file in "$@"
do
    if [[ ! -f "$file" ]]; then
        >&2 echo "File '$file' does not exist"
        continue
    fi

    if ! [[ $file =~ \.gz$ ]]; then
        >&2 echo "File '$file' does not seem to end in .gz"
        continue
    fi

    before=$(stat --printf='%s' "$file")
    base=${file%.gz}
    gunzip --quiet "$file"
    zstd --quiet --rm -9 "$base"
    after=$(stat --printf='%s' "$base.zst")
    >&2 echo "$file - $before -> $after = $((before - after)) saved"
done
