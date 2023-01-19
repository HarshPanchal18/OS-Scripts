#!/usr/bin/osascript

# Empty the trash bin

on run
    try
        tell application "Finder" to empty trash
    end try
end run
