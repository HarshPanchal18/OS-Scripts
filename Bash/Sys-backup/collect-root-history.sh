#!/bin/bash

#------------------------------------------
# Purpose: Collect Root Commands History
# Created Date:  Sunday 24 July 2022 03:37:15 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------


# Mailing List
MAILLIST="YOUREMAIL@DOMAIN"

# Log path
AUDLOG="/rootcommands"

cp /root/.bash_history /tmp/history

sed -i 's/#//g' /tmp/history

for i in `cat /tmp/history | grep ^[0-9]`
do
    CONVT=`date -d @$i`
    sed -i "s/$i/$CONVT/g" /tmp/history
done

sed -i 'N;s/\n/ /' /tmp/history

sleep 3

/bin/touch ${AUDLOG}$HOSTNAME-root-hist.log.`date +%h%d%y`
/bin/grep "$DATE" /tmp/history > ${AUDLOG}$HOSTNAME-root-hist.log.`date +%h%d%y`
/bin/chmod 0440 ${AUDLOG}$HOSTNAME-root-hist.log.`date +%h%d%y`

# Mail notification
/bin/cat ${AUDLOG}$HOSTNAME-root-hist.log.`date +%h%d%y` |mail -s "HOST: $HOSTNAME - `whoami` Daily root Commands Log" ${MAILLIST}
