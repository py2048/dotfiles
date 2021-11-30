#!/usr/bin/env bash

activate() {
    osascript -e 'tell application "System Preferences"
        activate
        set current pane to pane id "com.apple.preference.displays"
    end'
}

display_pref () {
    osascript -e 'tell application "System Preferences"
        set thePane to the id of the current pane
    end'
}

sidecar() {
    osascript -e 'tell application "System Preferences"
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
    end'
}

activate
sleep 1
until display_pref 2> /dev/null; do
    sleep 0.5
done
sleep 0.2
sidecar
