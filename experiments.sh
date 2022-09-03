#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Sunday 24 July 2022 03:53:57 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

set `date`
echo "Count $#"
echo "$1 $2 $3 $4 $5"
shift 2
echo "$1 $2 $3 $4 $5"

# Log arguments with timestamp to stdout.
echo $(date +%d-%m-%y_%H-%M-%S): $*

# Log each argument with timestamp to stdout on a separate line.

for arg in "$@"; do
    echo $(date +%d-%m-%y_%H-%M-%S): $arg
done

#Remove blank lines from input
grep -V '^[[:space:]]*$'

# Generate a "unique" 6-digit hexadecimal identifier.
uuidgen -r | cut -c -6

# Package: libmath-prime-util-perl
# Prints all prime numbers between 60000 and 63000.
primes 60000 63000 | column


# Print /etc/passwd with nice columnar output

column -t -s ':' /etc/passwd

# OTHER SOLUTIONS:
# tr ':' '\t' < /etc/passwd
# awk -F: '{printf "%-18s %s %s %s %s %s %s\n", $1, $2, $3, $4, $5, $6, $7}' /etc/passwd


#   Get the MAC addresses of the device from the ifconfig output.
ifconfig | grep HW | awk 'BEGIN { print "Device     MAC address"
print "------     ------" }
{ printf "%-10s %s\n", $1, $5 }'

#   Play a sound from terminal. Useful as and alert when
#   a long task finishes.
paplay /usr/share/sounds/freedesktop/stereo/complete.oga


### Making input invisible

stty -echo     # makes input invisible
stty echo      # to default

# creating directory and files without name

mkdir " "
touch " "


# creating directory -okgoogle
mkdir -p -- "-okgoogle"
#or
mkdir -- "-okgoogle"

#Chmod Reset File - resets files permissions
find . -type f -exec chmod 644 {} \;
#Chmod Reset Folder - resets folders permissions
find . -type d -exec chmod 744 {} \;

#Deadline
echo $(expr '(' $(date -d $2/$1/$3 +%s) - $(date +%s) + 86399 ')' / 86400) " days until deadline"

#fix Dropbox
dropbox stop && dbus-launch dropbox start

#Lamp Restart/Start/Stop
/etc/init.d/apache2 restart
/etc/init.d/mysql restart

#rmSnaps - remove old snaps
snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then snap remove "$snapname" --revision="$rev"; fi; done

#rmrfnm - removes node_modules recursively
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +

#Show packages
apt-cache pkgnames | grep -i "$1" | sort
