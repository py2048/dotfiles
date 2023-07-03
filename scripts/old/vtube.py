#!/usr/bin/env python
import sys
import os
import platform
import pyperclip
from urllib.parse import urlparse, parse_qs


def get_id(url):
    # Examples:
    # - http://youtu.be/SA2iWivDJiE
    # - http://www.youtube.com/watch?v=_oPAwA_Udwc&feature=feedu
    # - http://www.youtube.com/embed/SA2iWivDJiE
    # - http://www.youtube.com/v/SA2iWivDJiE?version=3&amp;hl=en_US
    query = urlparse(url)
    if query.hostname == 'youtu.be':
        return query.path[1:]
    elif query.hostname in {'www.youtube.com', 'youtube.com'}:
        if query.path == '/watch':
            return parse_qs(query.query)['v'][0]
        if query.path[:7] == '/embed/':
            return query.path.split('/')[2]
        if query.path[:3] == '/v/':
            return query.path.split('/')[2]
    else:
        print("Invalid URL")
        sys.exit()


def open(url):
    yid = str(get_id(url))
    pre = 'https://www.youtube.com/'
    vid = pre + 'watch?v=' + yid
    chat = pre + 'live_chat?is_popout=1&v=' + yid
    if platform.system() == 'Darwin':
        os.system(f"open -a IINA \"{vid}\"")
        os.system(f"open -a /Applications/Firefox.app \"{chat}\"")


if len(sys.argv) > 1:
    for url in sys.argv[1:]:
        open(url)
else:
    open(pyperclip.paste())
