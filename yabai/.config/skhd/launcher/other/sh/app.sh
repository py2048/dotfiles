#!/usr/bin/env bash

echo

column <<< $(cat <<-END
    [B] Brave Browser  
    [C] Visual Studio Code ﬏ 
    [D] Discord ﭮ 
    [K] KeePassXC  
    [M] Messenger  
    [O] Obsidian  
    [P] Parallels Desktop  
    [S] System Preferences  
    [T] Microsoft Teams  
    [V] VMware Fusion 
END
)

read -rsn1 key
# /usr/bin/read -p "sdfsdf" key

case $key in
    b|B) 
        echo "Brave"
        ;;
    c|C) 
        echo "Visual Studio Code"
        ;;
    d|D) 
        echo "Discord"
        ;;
    *)
        echo "None"
        ;;
esac
# read
# sleep 5
# skhd -k 'meh -a'
