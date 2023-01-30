#!/bin/osascript

# duplicate current tab and open

tell window 1 of application "Safari"
  set currentUrl to get URL of current tab
  set newTab to make new tab with properties {URL:currentUrl}
  set current tab to newTab
end tell
