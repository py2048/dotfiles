#!/usr/bin/env zsh

B_COLOR='0xFF3B465B'
B_COLOR_H='0xFFFEFEFE'

[ "$SELECTED" = "false" ] && sketchybar -m --set $NAME label.highlight=off icon.highlight=off background.color=$B_COLOR && exit 0

num2a() {
    case ${1} in
        1) NAME="one" ;;
        2) NAME="two" ;;
        3) NAME="three" ;;
        4) NAME="four" ;;
        5) NAME="five" ;;
        6) NAME="six" ;;
        7) NAME="seven" ;;
        8) NAME="eight" ;;
        9) NAME="nine" ;;
    esac
}


if [ "$SID" = '' ]; then
    # Get current space
    space=$(yabai -m query --windows --space)
    # Get current space number
    if [ "$space" = "[]" ]; then
        SID=$(yabai -m query --spaces | sed 's/is-visible/isvis/g' | jq -r '.[] | select(.isvis == true) | .index')
    else
        SID=$(jq -r '.[0].space' <<< "$space")
    fi

    num2a $SID
fi

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
    Microsoft\ Teams 'T'
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
    [ -z "$icon_app" ] && echo "" || echo "${icon_app//T}"

}

refresh_space() {
    # Refresh icons for current space
    [ -z "$space" ] && space=$(yabai -m query --windows --space $SID)
    
    # If there is no app, change icon to space number
    if [ "$space" = "[]" ]; then 
        sketchybar -m --set $NAME icon=""                 \
                  label.padding_left=2  \
                  label.padding_right=8 \
                  icon.padding_left=2   \
                  icon.padding_right=3   

        [ "$SELECTED" = false ] || sketchybar -m --set $NAME label.highlight=on \
                              icon.highlight=on  \
                              background.color=$B_COLOR_H  
        return
    fi

    # List unduplicated current apps
    apps=$(jq -r ".[].app" <<< "$space" | uniq)
    # Apps icons
    s_icon=''
    while IFS= read -r app; do
        # Insert seperator, if there are more than 1 app
        ! [ -z "$s_icon" ] && s_icon+=" "
        # Add icon
        s_icon+="$(to_icon $app)"
    done <<< "$apps"  # Iterate through apps

    # Asign icons to current spaces
    # spacebar -m config space_icon_strip "$space_icons[@]"
    sketchybar -m --set $NAME icon="${s_icon}"   \
                              label="$SID"       \
                              label.padding_left=2  \
                              label.padding_right=8 \
                              icon.padding_left=8   \
                              icon.padding_right=2   

    [ "$SELECTED" = false ] || sketchybar -m --set $NAME label.highlight=on  \
                              icon.highlight=on  \
                              background.color=$B_COLOR_H  
}

refresh_all() {
    SID_0=$SID
    max_space=$(yabai -m query --spaces | jq -r '.[].index' | tail -1) 
    for SID in $(seq 1 $max_space); do
        num2a $SID
        space=''
        [ "$SID" = "$SID_0" ] || SELECTED=false
        refresh_space
    done
}

if [ "$1" = "all" ]; then
    refresh_all
else
    refresh_space
fi


