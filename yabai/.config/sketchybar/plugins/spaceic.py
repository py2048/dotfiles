#!/usr/local/bin/python3

import sys
import json

App_Icons = {
    "alacritty": "",
    "Affinity Photo": " ",
    "Alfred": "",
    "AnyDesk": "ﲾ",
    "balenaEtcher": "",
    "Brave Browser": "",
    "Cantata": "ﱘ",
    "Code": "﬏",
    "Cog": "ﱘ",
    "Discord": "ﭮ",
    "Disk Utility": "",
    "Finder": "",
    "Firefox": "",
    "Font Book": "",
    "Free Download Manager": "",
    "GIMP": "",
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
    "Transmission Remote GUI": "",
    "VESTA": "",
    "VimR": "",
    "VMware Fusion": "",
    "VOX": "",
    "Xcode": "",
}

num2a = [
    None, 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
    'nine'
]

datajson = sys.stdin.read().split('\n\n')

cmd = datajson[0]
sidstr = datajson[1]

spaces = json.loads(datajson[2])
windows = [i for i in json.loads(datajson[3]) if not i['is-sticky']]


def skbar_icon(si, s_icon):
    if not s_icon:
        print(f'sketchybar -m --set {num2a[si]} icon=""', f'label="{si}"',
              'label.padding_left=2', 'label.padding_right=8',
              'icon.padding_left=2', 'icon.padding_right=3')
    else:
        print(f'sketchybar -m --set {num2a[si]} icon="{s_icon}"',
              f'label="{si}"', 'label.padding_left=2', 'label.padding_right=8',
              'icon.padding_left=8', 'icon.padding_right=2')


def refresh_space(sid, current=False):
    '''Refresh sketchybar icons for current space'''
    si = None
    if current:
        for s in spaces:
            if s['has-focus']:
                si = s['index']
    else:
        for s in spaces:
            if s['id'] == sid:
                si = s['index']
    if not si:
        return
    s_icon = ''
    s_app = []
    for w in windows:
        if w['space'] == si:
            app = w['app']
            if not app in s_app:
                s_app.append(app)
                if s_icon:
                    s_icon += ' '
                s_icon += App_Icons.get(app, '')

    skbar_icon(si, s_icon)


def refresh_cspace(sid0, sid):
    '''Refresh sketchybar icons when changing space'''
    refresh_space(sid0)
    refresh_space(sid)


def refresh_all():
    '''Refresh sketchybar icons for all space'''
    for s in spaces:
        refresh_space(s['id'])


if cmd == 'cspace':
    sid0, sid = sidstr.split(' ')
    sid0 = int(sid0)
    sid = int(sid)
    refresh_cspace(sid0, sid)
elif cmd == 'space':
    sid = int(sidstr)
    refresh_space(sid, current=True)
elif cmd == 'all':
    refresh_all()
