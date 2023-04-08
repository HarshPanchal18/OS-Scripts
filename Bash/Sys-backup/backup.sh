#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Friday 02 August 2022 11:45:17 AM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

src=<source_path>

dest=<dest_path>

timeStamp=$(date "+%Y-%m-%d-%H-%M-%S")

#backupFile=$dest/$timeStamp.tgz

bkupZip="backup"+$timeStamp
echo "Backup time $timeStamp"

#tar czf $backupFile --absolute-names $dest

zip -r $bkupZip.zip $src # Make a zip

rm $dest/backup+2022-08* 2>/dev/null # Prepared as monthly backup

#rm $dest/$bkupZip.zip 2>/dev/null # Deletes old one

mv $bkupZip.zip $dest # Move a fresh one

echo "Backed Up, Show $bkupZip.zip to the $dest directory"
