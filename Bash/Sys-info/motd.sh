#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Saturday 03 September 2022 01:31:36 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

# OS: For use and tested against CentOS 6.x
# Description: Runs at point of login, Displays Data to user logging in.
##################################################
# Set your Network card name
#
NET="eth0"
##################################################
# CPU Data Capture
CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)

nCPU=`cat /proc/cpuinfo | grep -c 'processor'`
declare -a CPU[${nCPU}]

for i in `seq 1 ${nCPU}`
do
    CPUMOD=`cat /proc/cpuinfo | grep -m 1 -w 'model name' | awk -F: '{print $2}'`
    CPUSPEC=`cat /proc/cpuinfo | grep -m 1 -w 'cpu MHz' | awk -F: '{print $2}'`
done

#User data capture
WHO=`who | wc -l`
WHAT=`w -hs`
USER=`whoami`
GROUP=`groups`

#System data capture
HOSTNAME=`hostname`
#SYSREL=`cat /etc/redhat-release`
#MYREL=`cat /blah/docs/release`
#INFO=`cat /blah/docs/info`
KERNEL=`uname -r`
UPTIME=`uptime|sed 's/^.*up *//;s/, *[0-9]* user.*$/m/; s/ day[^0-9]*/d, /;s/ \([hm]\).*m$/\1/;s/:/h, /; s/^/ /'`
BTIME=`who -b`

#Network data capture
IPADDR=`hostname -I`
EXTADDR=`dig myip.opendns.com @resolver1.opendns.com +short`
HWADDR=`ip link show $NET | awk '/ether/ {print $2}'`

#Memory data capture
MEM=`free | grep -w 'Mem' | awk '{print $2}'`
MEMFREE=`free | grep -w 'Mem' | awk '{print $4}'`
SWAP=`free | grep -w 'Swap' | awk '{print $2}'`
SWAPFREE=`free | grep -w 'Swap' | awk '{print $4}'`
let MEM="$MEM/1024"
let SWAP="$SWAP/1024"
let MEMFREE="MEMFREE/1024"
let SWAPFREE="SWAPFREE/1024"

# Disk Space Data Capture
ROOT=`df -h / | awk '{ a = $4 } END { print a }'`

# Load Data Capture
#
read one five fifteen rest < /proc/loadavg
##################################################
# Display Data to Users

echo -e "
\033[0;35m
                ==== BOOT TIME ====            ==== UPTIME ====
\033[1;34m      $BTIME        \033[1;34m$UPTIME
\033[0;35m

\033[0;35m=====================================: \033[1;32mSystem Info\033[0;35m :============================
+\033[0;37mHostname \033[0;35m= \033[1;34m$HOSTNAME
\033[0;35m+\033[0;37mLinux Version \033[0;35m= \033[1;34m$SYSREL
\033[0;35m+\033[0;37mJakes Version \033[0;35m= \033[1;34m$MYREL
\033[0;35m+\033[0;37mKernel \033[0;35m= \033[1;34m$KERNEL
\033[0;35m+\033[0;37mCPU \033[0;35m= \033[1;34m[${i}]:${CPUMOD} @${CPUSPEC} MHz

\033[0;35m-------------------------------------: \033[1;32mNetwork Data\033[0;35m :---------------------------
\033[0;35m+\033[0;37mInternal IP Address \033[0;35m= \033[1;34m$IPADDR
\033[0;35m+\033[0;37mExternal IP Address \033[0;35m= \033[1;34m$EXTADDR
\033[0;35m+\033[0;37mHardware Address \033[0;35m= \033[1;34m$HWADDR

\033[0;35m-------------------------------------: \033[1;32mSystem Data\033[0;35m :----------------------------
\033[0;35m+\033[0;37mLoad \033[0;35m= \033[0;37m1 Min: \033[1;34m${one} \033[0;37m5 Min: \033[1;34m${five} \033[0;37m15 Min: \033[1;34m${fifteen}
\033[0;35m+\033[0;37mCPU Avarage \033[0;35m= \033[1;34m`echo $CPUTIME / $CPUCORES | bc`%
\033[0;35m+\033[0;37mMemory \033[0;35m= \033[1;34m${MEM} MB \033[0;37mMemory Free \033[0;35m= \033[1;34m${MEMFREE} MB
\033[0;35m+\033[0;37mSwap \033[0;35m= \033[1;34m${SWAP} MB \033[0;37mSwap Free \033[0;35m= \033[1;34m${SWAPFREE} MB
\033[0;35m+\033[0;37mDisk Space Available - root \033[0;35m= \033[1;34m$ROOT

\033[0;35m--------------------------------------: \033[1;32mUser Data\033[0;35m :-----------------------------
+\033[0;37mUsername \033[0;35m= \033[1;34m$USER
\033[0;35m+\033[0;37mGroups \033[0;35m= \033[1;34m$GROUP
\033[0;35m+\033[0;37mUsers on the System \033[0;35m= \033[1;34m$WHO
\033[1;32mUSER\033[0;35m :-: \033[1;32mTTY\033[0;35m :--: \033[1;32mIP\033[0;35m :-----------: \033[1;32mIDLE\033[0;35m : \033[1;32mUser Command \033[0;35m:------------------------
\033[1;34m$WHAT

\033[0;35m-------------------------------: \033[1;32mHelpful Information\033[0;35m :--------------------------
\033[1;34m $INFO
\033[0;35m================================================================================
"
