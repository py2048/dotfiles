#!/usr/bin/env zsh

read -d '' AppleScript <<EOF
tell application "System Preferences"
activate
reveal pane id "com.apple.preference.sidecar"
delay 0.5

tell application "System Events" to click first menu button of first window of application process "System Preferences" of application "System Events"
tell application "System Events" to click first menu item of first menu of first menu button of first window of application process "System Preferences" of application "System Events"

quit
end tell
EOF
osascript -e "$AppleScript"
exit 0
