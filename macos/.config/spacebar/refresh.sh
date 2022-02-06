#!/usr/bin/env zsh

#     輪   
declare -A App_Icon=(
    alacritty 
    Affinity\ Photo  
    balenaEtcher 
    Brave\ Browser 
    Code ﬏
    Discord ﭮ
    Disk\ Utility 
    Finder 
    Firefox 
    Font\ Book 
    Free\ Download\ Manager 
    GoldenDict 
    IINA 輪
    mpv 輪
    Inkscape 
    KeePassXC 
    Keychain\ Access 
    kitty 
    Messenger 
    Microsoft\ Excel 
    Microsoft\ PowerPoint 
    Microsoft\ Teams ' '
    Microsoft\ Word 
    Numbers 
    Parallels\ Desktop 
    Obsidian  
    Pine  
    Preview 
    Skim 
    Spark 﫯
    Mail 﫯
    Spotlight 
    System\ Preferences 
    TeamViewer 刺
    The\ Unarchiver 
    Transmission 
    VimR 
    VMware\ Fusion 
    VOX 
)

to_icon() {
    # Return  applications icons from text
    icon_app=$App_Icon[$1]
    [ -z "$icon_app" ] && echo "" || echo "$icon_app"

}

refresh_all() {
    # Refresh icons for all spaces
    
    # Get info for all windows
    windows=$(yabai -m query --windows) # 
    # Get current value of icons
    eval "space_icons=($(spacebar -m config space_icon_strip))"
    # Iterate over spaces
    for space_num in $(yabai -m query --spaces | jq -r ".[].index"); do
        # List current apps (unduplicated)
        apps=$(jq -r ".[] | select(.space == $space_num) | .app" <<< "$windows" | uniq)
        
        # Debug
        # echo -n "$space_num: " 
        # echo $apps
        
        # If there is no app, change icon to the number of current space
        [ -z "$apps" ] && space_icons[$space_num]="$space_num" && continue
        # Apps icons
        s_icon=''
        while IFS= read -r app; do
            # Insert seperator, if there are more than 1 app
            ! [ -z "$s_icon" ] && s_icon+=" "
            # Add icon
            s_icon+="$(to_icon $app)"
        done <<< "$apps"  # Iterate through apps
        # Asign icons to current spaces
        space_icons[$space_num]="${s_icon}"
    done
    # echo "$space_icons"
    # Change icons to current space
    spacebar -m config space_icon_strip "$space_icons[@]"

}

refresh_space() {
    # Refresh icons for current space
    # space=$(yabai -m query --windows --space)
    space=$(yabai -m query --windows --space "$@")
    # Get current space number
    space_num=$(jq -r '.[0].space' <<< "$space")
    # List current icons
    eval "space_icons=($(spacebar -m config space_icon_strip))"
    
    # If there is no app, change icon to space number
    if [ "$space" = "[]" ]; then 
        space_num=$(yabai -m query --spaces | jq -r ".[] | select(.focused == 1) | .index")
        space_icons[$space_num]="$space_num"
        spacebar -m config space_icon_strip "$space_icons[@]"
        return
    fi

    # List unduplicated current apps
    apps=$(jq -r ".[] | select(.space == $space_num) | .app" <<< "$space" | uniq)
    # Apps icons
    s_icon=''
    while IFS= read -r app; do
        # Insert seperator, if there are more than 1 app
        ! [ -z "$s_icon" ] && s_icon+=" "
        # Add icon
        s_icon+="$(to_icon $app)"
    done <<< "$apps"  # Iterate through apps
    # Asign icons to current spaces
    space_icons[$space_num]="${s_icon}"
    # echo $space_icons
    spacebar -m config space_icon_strip "$space_icons[@]"
}

space="$1"
shift
refresh_"$space" "$@"
# refresh_all
# refresh_space
