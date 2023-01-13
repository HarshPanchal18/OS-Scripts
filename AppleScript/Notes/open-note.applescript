#!/usr/bin/osascript

on run argv
    tell application "Notes"
        if exists note (item 1 of argv)
            show note (item 1 of argv)
        else
            log "Sorry, the note \"" & (item 1 of argv) & "\" was not found"
        end if
    end tell
end run
