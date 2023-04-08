#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Saturday 18 June 2022 03:13:32 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

maim -s "$HOME"/img/scrn-"$(date +'%s')".png
notify-send "Screenshot saved!"
