#!/usr/bin/osascript

tell application "Finder" to restart

tell application "Finder" to shut down

tell application "Finder" to sleep

tell application "System Events"
    start current screen saver
end tell
