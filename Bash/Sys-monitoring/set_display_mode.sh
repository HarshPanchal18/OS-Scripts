#!/usr/bin/env sh

#------------------------------------------
# Purpose: 
# Created Date:  Saturday 18 June 2022 03:15:57 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------


CONFIG="$HOME/.config/display_mode"
DISPLAY_INTERNAL="${DISPLAY_INTERNAL:-eDP1}"
DISPLAY_EXTERNAL="${DISPLAY_EXTERNAL:-HDMI1}"

AWK_HELP='$1 ~ /.*)/ { gsub(/\|.*|).*/, "", $1); if ( $1 ~ /"/ ) { next; } a = $1 " " a } END { printf("valid commands: %s\n", a)}'

case "$1" in
    extend)
        xrandr --output "$DISPLAY_INTERNAL" --auto \
               --output "$DISPLAY_EXTERNAL" --auto --right-of "$DISPLAY_INTERNAL"
        echo "$DISPLAY_INTERNAL+$DISPLAY_EXTERNAL" > "$CONFIG";;

    mirror)
        xrandr --output "$DISPLAY_EXTERNAL" --auto \
               --output "$DISPLAY_INTERNAL" --auto --same-as "$DISPLAY_EXTERNAL"
        echo "$DISPLAY_INTERNAL=$DISPLAY_EXTERNAL" > "$CONFIG";;

    toggle)
        case $(cat "$CONFIG") in
            "$DISPLAY_EXTERNAL")
                xrandr --output "$DISPLAY_EXTERNAL" --off \
                       --output "$DISPLAY_INTERNAL" --auto
                echo "$DISPLAY_INTERNAL" > "$CONFIG";;
            "$DISPLAY_INTERNAL"|*)
                if test "$(xrandr | grep "$DISPLAY_EXTERNAL" | cut -d' ' -f2)" = connected; then
                    xrandr --output "$DISPLAY_EXTERNAL" --auto \
                           --output "$DISPLAY_INTERNAL" --off
                    echo "$DISPLAY_EXTERNAL" > "$CONFIG"
                fi;;
        esac;;

    external|"$DISPLAY_EXTERNAL")
        xrandr --output "$DISPLAY_INTERNAL" --off \
               --output "$DISPLAY_EXTERNAL" --auto
        echo "$DISPLAY_EXTERNAL" > "$CONFIG";;

    internal|"$DISPLAY_INTERNAL")
        xrandr --output "$DISPLAY_EXTERNAL" --off \
               --output "$DISPLAY_INTERNAL" --auto
        echo "$DISPLAY_INTERNAL" > "$CONFIG";;

    help) awk "$AWK_HELP" "$0";;

    status|*)
        cat "$CONFIG";;
esac
