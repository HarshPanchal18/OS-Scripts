#!/usr/bin/osascript

on run argv
    set content to "<body><h1 style=\"color:black;\"> " &(item 1 of argv) & "</h1>
    <p style=\"color:black;\" >" & (item 2 of argv) & "</p>
    </body>"

    tell application "Notes"
        activate
        make new note at folder "Notes" with properties {name:"",body:content}
    end tell
end run
