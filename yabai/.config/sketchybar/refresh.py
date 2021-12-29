#!/usr/bin/env python3

import sys
import json

App_Icons = {
    "alacritty": "",
    "Affinity Photo": " ",
    "Alfred 4 ": "AnyDesk ﲾ ",
    "balenaEtcher": "",
    "Brave Browser": "",
    "Code": "﬏",
    "Discord": "ﭮ",
    "Disk Utility": "",
    "Finder": "",
    "Firefox": "",
    "Font Book": "",
    "Free Download Manager": "",
    "GoldenDict": "",
    "IINA": "輪",
    "mpv": "輪",
    "Inkscape": "",
    "KeePassXC": "",
    "Keychain Access": "",
    "kitty": "",
    "Messenger": "",
    "Microsoft Excel": "",
    "Microsoft PowerPoint": "",
    "Microsoft Teams": "",
    "Microsoft Word": "",
    "Numbers": "",
    "Parallels Desktop": "",
    "Obsidian": " ",
    "Pine": " ",
    "Preview": "",
    "Skim": "",
    "Spark": "﫯",
    "Mail": "﫯",
    "Spotlight": "",
    "System Preferences": "",
    "TeamViewer": "刺",
    "The Unarchiver": "",
    "Transmission": "",
    "VimR": "",
    "VMware Fusion": "",
    "VOX": "",
}

num2a = [
    None, 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
    'nine'
]

datajson = sys.stdin.read().split('\n\n')

cmd = datajson[0]
sid = int(datajson[1])
sid0 = int(datajson[2])

spaces = json.loads(datajson[3])
windows = [i for i in json.loads(datajson[4]) if not i['is-sticky']]


def refresh_space(sid, sid0, r0=False):
    for s in spaces:
        if s['id'] == sid:
            si = s['index']
        if s['id'] == sid0:
            si0 = s['index']
    print(si, si0)

    s_icon = ''
    s_app = []
    s_icon0 = ''
    s_app0 = []
    for w in windows:
        if w['space'] == si:
            app = w['app']
            if not app in s_app:
                s_app.append(app)
                if s_icon:
                    s_icon += ' '
                s_icon += App_Icons.get(app, '')
        if r0:
            if w['space'] == si0:
                app = w['app']
                if not app in s_app0:
                    s_app0.append(app)
                    if s_icon0:
                        s_icon0 += ' '
                    s_icon0 += App_Icons.get(app, '')
    if not s_icon:
        s_icon = str(si)
    if not s_icon0 and r0:
        s_icon0 = str(si0)

    print(s_icon, s_icon0, '')


refresh_space(sid, sid0, True)
