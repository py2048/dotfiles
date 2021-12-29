#!/usr/bin/env zsh

B_COLOR='0xFF3B465B'
B_COLOR_H='0xFFFEFEFE'


num2a() {
    case ${1} in
        1) echo "one" ;;
        2) echo "two" ;;
        3) echo "three" ;;
        4) echo "four" ;;
        5) echo "five" ;;
        6) echo "six" ;;
        7) echo "seven" ;;
        8) echo "eight" ;;
        9) echo "nine" ;;
    esac
}

# App icons
declare -A App_Icon=(
    alacritty 
    Affinity\ Photo  
    Alfred\ 4 
    AnyDesk ﲾ 
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

spaces=$(yabai -m query --spaces)
space=$(yabai -m query --windows --space | jq -r '[ .[] | select(.["is-sticky"] == false) ]')


refresh_space() {
    # Refresh icons for current space
    space=$(yabai -m query --windows --space | jq -r '[ .[] | select(.["is-sticky"] == false) ]')
    IFS=$'\n' SIDS=($(yabai -m query --spaces | jq -r " .[] | select(.id == $1 or .id == $2) | .index"))

    sid=$(num2a ${SIDS[1]})
    sid0=$(num2a ${SIDS[2]})

    echo $sid $sid0
    
    # If there is no app, change icon to space number
    if [ "$space" = "[]" ]; then 
        sketchybar -m --set $NAME icon=""    \
                  label.padding_left=2  \
                  label.padding_right=8 \
                  icon.padding_left=2   \
                  icon.padding_right=3   

        # [ "$SELECTED" = false ] || sketchybar -m --set $NAME label.highlight=on \
        #                       icon.highlight=on  \
        #                       background.color=$B_COLOR_H  

        # [ "$SELECTED" = false ] && sketchybar -m --set $NAME label.highlight=off \
        #                       icon.highlight=off  \
        #                       background.color=$B_COLOR  
        sketchybar -m --set $NAME label.highlight=on \
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
                              icon.padding_right=2   \

    # [ "$SELECTED" = false ] || sketchybar -m --set $NAME label.highlight=on  \
    #                           icon.highlight=on  \
    #                           background.color=$B_COLOR_H  
    # [ "$SELECTED" = false ] && sketchybar -m --set $NAME label.highlight=off \
    #                       icon.highlight=off  \
    #                       background.color=$B_COLOR  
    sketchybar -m --set $NAME label.highlight=on \
                              icon.highlight=on  \
                              background.color=$B_COLOR_H
}

NAME=one
SID=1

refresh_space "$@"
