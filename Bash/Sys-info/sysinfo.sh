#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Saturday 18 June 2022 07:42:41 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

#                           ██            ████
#                          ░░            ░██░
#   ██████  ██   ██  ██████ ██ ███████  ██████  ██████
#  ██░░░░  ░░██ ██  ██░░░░ ░██░░██░░░██░░░██░  ██░░░░██
# ░░█████   ░░███  ░░█████ ░██ ░██  ░██  ░██  ░██   ░██
#  ░░░░░██   ░██    ░░░░░██░██ ░██  ░██  ░██  ░██   ░██
#  ██████    ██     ██████ ░██ ███  ░██  ░██  ░░██████
# ░░░░░░   ██      ░░░░░░  ░░ ░░░   ░░   ░░    ░░░░░░
#        ░░
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ vars
#FULL=▓
#EMPTY=░
FULL=━
EMPTY=━
#EMPTY=─
#FULL=┅
#EMPTY=┄

name=$USER
host=`hostname`
distro="kali linux"
kernel=`uname -r`
#pkgs=`pacman -Qqs | wc -l`
colors='sourcerer'
font='envypn 13'
wm='bspwm'

#█▓▒░ progress bar
draw()
{
  perc=$1
  size=$2
  inc=$(( perc * size / 100 ))
  out=

  if [ -z $3 ]
  then
    color="36"
  else
    color="$3"
  fi

  for v in `seq 0 $(( size - 1 ))`; do
    test "$v" -le "$inc"   \
    && out="${out}\e[1;${color}m${FULL}" \
    || out="${out}\e[0;${color}m${EMPTY}"
  done

  printf $out
}

#█▓▒░ colors
printf "\n"
i=0

while [ $i -le 6 ]
do
  printf "\e[$((i+41))m\e[$((i+30))m█▓▒░"
  i=$(($i+1))
done

printf "\e[37m█\e[0m▒░\n\n"


#█▓▒░ greets
printf " \e[0m  Hello \e[37m$name\033[0m, I'm \e[34m$host\n"
printf " \e[0m\n"

#█▓▒░ environment
printf " \e[1;33m      distro \e[0m$distro\n"
printf " \e[1;33m      kernel \e[0m$kernel\n"
#printf " \e[1;33m    packages \e[0m$pkgs\n"
printf " \e[1;33m          wm \e[0m$wm\n"
printf " \e[1;33m        font \e[0m$font\n"
printf " \e[1;33m      colors \e[0m$colors\n"
printf " \e[0m\n"

#█▓▒░ cpu
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
c_lvl=`printf "%.0f" $cpu`
printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " cpu" "$c_lvl%" `draw $c_lvl 15`

#█▓▒░ ram
ram=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " ram" "$ram%" `draw $ram 15`

#█▓▒░ temperature
#temp=`sensors | awk '/Core\ 0/ {gsub(/\+/,"",$3); gsub(/\..+/,"",$3)    ; print $3}'`

#case 1 in
#  $(($temp <= 50)))
#    color='34'
#    ;;
#  $(($temp >= 75)))
#    color='31'
#    ;;
#  *)
#    color='36'
#    ;;
#esac

#printf "   \e[0;${color}m%-4s \e[1;${color}m%-5s %-25s \n\n" "temp" "$temp°c " `draw $temp 15 $color`
                                            
