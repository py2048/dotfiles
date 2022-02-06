#!/usr/bin/env python
import subprocess
import os

Apps = {
    "b": { "app": "Brave Browser", "icon": " " },
    "c": { "app": "Visual Studio Code", "icon": "﬏ " },
    "d": { "app": "Discord", "icon": "ﭮ " },
    "k": { "app": "KeePassXC", "icon": " " },
    "m": { "app": "Messenger", "icon": " " },
    "o": { "app": "Obsidian", "icon": " " },
    "p": { "app": "Parallels Desktop", "icon": " " },
    "s": { "app": "System Preferences", "icon": " " },
    "t": { "app": "Microsoft Teams", "icon": " " },
    "v": { "app": "VMware Fusion", "icon": "" }
}

print()

i = 0
for k in Apps:
    if i % 2:
        nl='\n'
    else:
        nl=''
    i+=1
    print('    [{}] {:<25s}{}'.format(k.upper(), Apps[k]["app"] + ' ' + Apps[k]["icon"], nl), end='')


try:
    key = subprocess.check_output(os.path.expanduser('~') + '/.local/bin/readkey.sh', timeout=5).decode('utf-8').rstrip()
except subprocess.TimeoutExpired:
    exit()

if key in Apps:
    os.system(f'open -a "{Apps[key]["app"]}"')
else:
    exit()

