#!/bin/bash

# https://github.com/inthuriel/human-cron
# Purpose: Displays user crontab in human readable form
# based on 'crontab' command
# Bash script presents crontab in human readable form.
# Script uses crontab commad avaliable in Ubuntu / Debian and similar Linux distributions
# Sample use: ./humanCron.sh [user]
# Sample output: Command /root/data1.txt will be performed daily o hour 0:00
# Output commands only in polish language.

# Created Date:  Thursday 19 May 2022 02:50:35 PM IST
# Author: Harsh Panchal

# START #

if [[ -z $1 ]]
then
    echo "Enter the CRON user for which to display the tables"
    exit 1;
fi;

echo -e "List of commands to be executed for the user $1\n"
crontab -l -u $1 | while read line
do
    if [[ ! $line =~ ^\# && ! -z $line ]]
    then
        COMBINED_DATE=0
        TIME_str=""
        DATE_str=""

        #explode to values
        COMMAND=`echo "$line" | sed 's/^\(.\{1,8\} \)\{5\}//'`
        MINUTES=`echo "$line" | cut -d" " -f1`
        HOUR=`echo "$line" | cut -d" " -f2`

        MONTH_DAY=`echo "$line" | cut -d" " -f3`
        MONTH=`echo "$line" | cut -d" " -f4`
        WEEK_DAY=`echo "$line" | cut -d" " -f5`

        #command string
        ECHO_str="Command $COMMAND will be performed"

        #process values
        #hours
        if [[ ! $HOUR =~ ^\*$ && ! -z $HOUR ]]
        then
            if [[ $HOUR =~ ^\*\/[0-9]{1,2}$ && ! -z $HOUR ]]
            then
                NUM_HOUR=`echo "$HOUR" |cut -d"/" -f2`;
                        HR_str="co $NUM_HOUR hours";
            elif [[ $HOUR =~ ^[0-9]{1,2}$ && ! -z $HOUR ]]; then
                HR_str="o hour $HOUR"
                COMBINED_DATE=1
            elif [[ $HOUR =~ ^[0-9]{1,2}-[0-9]{1,2}$ && ! -z $HOUR ]]; then
                FR_NUM_HOUR=`echo "$HOUR" |cut -d"-" -f1`;
                TO_NUM_HOUR=`echo "$HOUR" |cut -d"-" -f2`;
                HR_str="between time $FR_NUM_HOUR a $TO_NUM_HOUR"
            elif [[ $HOUR =~ ^[0-9]{1,2}-[0-9]{1,2}\/[0-9]{1,2}$ && ! -z $HOUR ]]; then
                NUM_HOUR=`echo "$HOUR" |cut -d"/" -f2`;
                HOUR_RANGE=`echo "$HOUR" |cut -d"/" -f1`;
                FR_NUM_HOUR=`echo "$HOUR_RANGE" |cut -d"-" -f1`;
                TO_NUM_HOUR=`echo "$HOUR_RANGE" |cut -d"-" -f2`;
                HR_str="between time $FR_NUM_HOUR a $TO_NUM_HOUR, co
                $NUM_HOUR hours"
            fi;
        else
            HR_str=""
        fi;

        #minute
        if [[ ! $MINUTES =~ ^\*$ && ! -z $MINUTES ]]
        then
            if [[ $MINUTES =~ ^\*\/[0-9]{1,2}$ && ! -z $MINUTES ]]; then
                NUM_MINUTES=`echo "$MINUTES" |cut -d"/" -f2`
                MIN_str="co $NUM_MINUTES minute"
            elif [[ $COMBINED_DATE == 1 ]]
            then
                if [[ ! $MINUTES =~ ^\*$ && ! -z $MINUTES ]]
                then
                    MIN_str="$MINUTES"
                else
                    MIN_str="w $MINUTES minute"
                fi;
            elif [[ $MINUTES =~ ^[0-9]{1,2}-[0-9]{1,2}$ && ! -z $MINUTES ]]
            then
                FR_NUM_MINUTES=`echo "$MINUTES" |cut -d"-" -f1`;
                TO_NUM_MINUTES=`echo "$MINUTES" |cut -d"-" -f2`;
                MIN_str="between $FR_NUM_MINUTES a $TO_NUM_MINUTES minute"
            elif [[ $MINUTES =~ ^[0-9]{1,2}-[0-9]{1,2}\/[0-9]{1,2}$ && ! -z $MINUTES ]]; then
                NUM_MINUTES=`echo "$MINUTES" |cut -d"/" -f2`;
                MINUTES_RANGE=`echo "$MINUTES" |cut -d"/" -f1`;
                FR_NUM_MINUTES=`echo "$MINUTES_RANGE" |cut -d"-" -f1`;
                TO_NUM_MINUTES=`echo "$MINUTES_RANGE" |cut -d"-" -f2`;
                MIN_str="between $FR_NUM_MINUTES a $TO_NUM_MINUTES minute, co $NUM_MINUTES minutes"
            fi;
        else
            MIN_str=""
        fi;


        #day of month
        if [[ ! $MONTH_DAY =~ ^\*$ && ! -z $MONTH_DAY ]]
        then
            if [[ $MONTH_DAY =~ ^\*\/[0-9]{1,2}$ && ! -z $MONTH_DAY ]]
                then
                    NUM_MONTH_DAY=`echo "$MONTH_DAY" |cut -d"/" -f2`
                    MON_D_str="co $NUM_MONTH_DAY days"
            elif [[ $MONTH_DAY =~ ^[0-9]{1,2}$ && ! -z $MONTH_DAY ]]
                then
                    MON_D_str="$MONTH_DAY day month"
            elif [[ $MONTH_DAY =~ ^[0-9]{1,2}-[0-9]{1,2}$ && ! -z $MONTH_DAY ]]
                then
                    FR_NUM_MONTH_DAY=`echo "$MONTH_DAY" |cut -d"-" -f1`;
                    TO_NUM_MONTH_DAY=`echo "$MONTH_DAY" |cut -d"-" -f2`;
                    MON_D_str="between $FR_NUM_MONTH_DAY a $TO_NUM_MONTH_DAY day month"
            elif [[ $MONTH_DAY =~ ^[0-9]{1,2}-[0-9]{1,2}\/[0-9]{1,2}$ && ! -z $MONTH_DAY ]]
                then
                    NUM_MONTH_DAY=`echo "$MONTH_DAY" |cut -d"/" -f2`;
                    MONTH_DAY_RANGE=`echo "$MONTH_DAY" |cut -d"/" -f1`;
                    FR_NUM_MONTH_DAY=`echo "$MONTH_DAY_RANGE" |cut -d"-" -f1`;
                    TO_NUM_MONTH_DAY=`echo "$MONTH_DAY_RANGE" |cut -d"-" -f2`;
                    MON_D_str="between $FR_NUM_MONTH_DAY a $TO_NUM_MONTH_DAY day month, co $NUM_MONTH_DAY days"
            fi;
        else
            MON_D_str=""
        fi;

        #month
        if [[ ! $MONTH =~ ^\*$ && ! -z $MONTH ]]
        then
            if [[ $MONTH =~ ^\*\/[0-9]{1,2}$ && ! -z $MONTH ]]
            then
                NUM_MONTH=`echo "$MONTH" |cut -d"/" -f2`
                MON_str="co $NUM_MONTH months"
            elif [[ $MONTH =~ ^[0-9]{1,2}$ && ! -z $MONTH ]]
            then
                MON_str="w $MONTH miesiacu"
            elif [[ $MONTH =~ ^[0-9]{1,2}-[0-9]{1,2}$ && ! -z $MONTH ]]
            then
                FR_NUM_MONTH=`echo "$MONTH" |cut -d"-" -f1`;
                TO_NUM_MONTH=`echo "$MONTH" |cut -d"-" -f2`;
                MON_str="between $FR_NUM_MONTH a $TO_NUM_MONTH a month"
            elif [[ $MONTH =~ ^[0-9]{1,2}-[0-9]{1,2}\/[0-9]{1,2}$ && ! -z $MONTH ]]; then
                NUM_MONTH=`echo "$MONTH" |cut -d"/" -f2`;
                MONTH_RANGE=`echo "$MONTH" |cut -d"/" -f1`;
                FR_NUM_MONTH=`echo "$MONTH_RANGE" |cut -d"-" -f1`;
                TO_NUM_MONTH=`echo "$MONTH_RANGE" |cut -d"-" -f2`;
                MON_str="between $FR_NUM_MONTH a $TO_NUM_MONTH a month, co $NUM_MONTH months"
            fi;
        else
            MON_str=""
        fi;


        #week day
        if [[ ! $WEEK_DAY =~ ^\*$ && ! -z $WEEK_DAY ]]
        then
            if [[ $WEEK_DAY =~ ^\*\/[0-9]{1,2}$ && ! -z $WEEK_DAY ]]
            then
                NUM_WEEK=`echo "$WEEK_DAY" |cut -d"/" -f2`
                WEK_str="co $NUM_WEEK days week"
            elif [[ $WEEK_DAY =~ ^[0-9]{1,2}$ && ! -z $WEEK_DAY ]]
            then
                WEK_str="$WEEK_DAY day week"

            elif [[ $WEEK_DAY =~ ^[0-9]{1,2}-[0-9]{1,2}$ && ! -z $WEEK_DAY ]]
            then
                FR_NUM_WEEK_DAY=`echo "$WEEK_DAY" |cut -d"-" -f1`;
                TO_NUM_WEEK_DAY=`echo "$WEEK_DAY" |cut -d"-" -f2`;
                WEK_str="between $FR_NUM_WEEK_DAY a $TO_NUM_WEEK_DAY day week"
            elif [[ $WEEK_DAY =~ ^[0-9]{1,2}-[0-9]{1,2}\/[0-9]{1,2}$ && ! -z $WEEK_DAY ]]
            then
                NUM_WEEK_DAY=`echo "$WEEK_DAY" |cut -d"/" -f2`;
                WEEK_DAY_RANGE=`echo "$WEEK_DAY" |cut -d"/" -f1`;
                FR_NUM_WEEK_DAY=`echo "$WEEK_DAY_RANGE" |cut -d"-" -f1`;
                TO_NUM_WEEK_DAY=`echo "$WEEK_DAY_RANGE" |cut -d"-" -f2`;
                MON_str="between $FR_NUM_WEEK_DAY a $TO_NUM_WEEK_DAY day week, co $NUM_WEEK_DAY days"
            fi;
        else
            WEK_str=""
        fi;

        #generate string for end user
        if [[ $COMBINED_DATE == 1 ]]
        then
            if [[ $MIN_str =~ ^[0-9]{1}$ ]]
            then
                MIN_str="0$MIN_str"
            fi;

            TIME_str="$HR_str:$MIN_str, "
        else
            if [[ ! -z $HR_str ]]
            then
                TIME_str="$HR_str, "
            else
                TIME_str="$TIME_str$MIN_str, "
            fi;
        fi;

        if [[ ! -z $WEK_str || ! -z $MON_str || ! -z $MON_D_str ]]
        then
            if [[ ! -z $WEK_str ]]
            then
                DATE_str="$WEK_str, "
            fi;
            if [[ ! -z $MON_str ]]
            then
                DATE_str="$DATE_str$MON_str, "
            fi;
            if [[ ! -z $MON_D_str ]]
            then
                DATE_str="$DATE_str$MON_D_str, "
            fi;
        else
            DATE_str="daily"
        fi;

        if [[ $DATE_str =~ ^daily$ ]]
        then
            echo "-+ $ECHO_str $DATE_str $TIME_str" | sed 's/.\{2\}$//'
        else
            echo "-+ $ECHO_str $TIME_str $DATE_str" | sed 's/.\{2\}$//'
        fi;

        echo "--"
    fi;
done;

exit 0;
