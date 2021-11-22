#!/usr/bin/osascript
tell application "System Preferences"
    activate
    set current pane to pane id "com.apple.preference.displays"
    delay 2
    tell application "System Events"
        tell process "System Preferences"
            tell pop up button "Add Display" of window "Displays"
                click
                delay 0.2
                click menu item "MQiPad" of menu 1
            end
        end tell
    end tell
    quit
end
