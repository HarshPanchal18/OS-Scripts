#!/bin/bash

echo "echo 3 > /proc/sys/vm/drop_caches" # 1 for pagecache,2 for dentries & inodes, and 3 for all

free -h   # Display amount of free and used memory in the system, -h for Human readable form of details

# you can use these commands also
<<commands
sysctl vm.drop_caches=1 # clear PageCache only
sysctl vm.drop_caches=2 # clear dentries and inodes
sysctl vm.drop_caches=3 # clear all of above
commands

<<firefox
#clear cache 
rm -rf ~/.chache/mozilla/firefox/*

#clear browsing history
rm ~/.mozilla/firefox/*release/*.sqlite
firefox
