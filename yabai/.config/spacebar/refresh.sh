#!/usr/bin/env zsh

#     輪   
to_icon() {
    # Return  applications icons from text
    case "$1" in
        kitty | alacritty)
            echo ""
            ;;
        Brave\ Browser | Chromium)
            echo ""
            ;;
        Finder)
            echo ""
            ;;
        Free\ Download\ Manager)
            echo ""
            ;;
        Code)
            echo "﬏"
            ;;
        Obsidian | Pine)
            echo " "
            ;;
        GoldenDict)
            echo ""
            ;;
        IINA)
            echo "輪"
            ;;
        Microsoft\ Teams)
            echo ""
            ;;
        Skim)
            echo ""
            ;;
        Spotlight)
            echo ""
            ;;
        Messenger)
            echo ""
            ;;
        Transmission)
            echo ""
            ;;
        KeePassXC | Keychain\ Access)
            echo ""
            ;;
        VimR)
            echo ""
            ;;
        Preview)
            echo ""
            ;;
        VMware\ Fusion)
            echo ""
            ;;
        Spark | Mail)
            echo "﫯"
            ;;
        Discord)
            echo "ﭮ"
            ;;
        Inkscape)
            echo ""
            ;;
        Firefox)
            echo ""
            ;;
        Font\ Book)
            echo ""
            ;;
        System\ Preferences)
            echo ""
            ;;
        TeamViewer)
            echo "刺"
            ;;
        The\ Unarchiver)
            echo ""
            ;;
        Microsoft\ Excel | Numbers)
            echo ""
            ;;
        Microsoft\ Word)
            echo ""
            ;;
        Microsoft\ PowerPoint)
            echo ""
            ;;
        Disk\ Utility)
            echo ""
            ;;
        VOX | Music)
            echo ""
            ;;
        balenaEtcher)
            echo ""
            ;;
        *)
            # echo "ﬓ"
            # echo "裡"
            echo ""
            ;;
    esac
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
    space=$(yabai -m query --windows --space)
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
    spacebar -m config space_icon_strip "$space_icons[@]"
}

refresh_"$1"
