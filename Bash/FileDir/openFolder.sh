#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Thursday 18 August 2022 10:18:05 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

[[ ${1} =~ "~" ]] && open $(sed -r 's#-#'$HOME'#' <<< "$1") || open ${1}
