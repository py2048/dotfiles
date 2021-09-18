#!/usr/bin/env zsh

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

sleep 5
skhd -k 'meh -a'
