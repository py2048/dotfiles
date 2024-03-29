#!/usr/bin/env python

import requests
import json
import os

apps = {
    'pistol': ['doronbehar/pistol', 'pistol-static-linux-x86_64', 'mv pistol-static-linux-x86_64 pistol'],
    # 'deno': [
    #     'denoland/deno', 'deno-x86_64-unknown-linux-gnu.zip',
    #     'unzip -o deno-x86_64-unknown-linux-gnu.zip && rm deno-x86_64-unknown-linux-gnu.zip'
    # ]
    # 'onlyoffice': ['ONLYOFFICE/appimage-desktopeditors', 'DesktopEditors-x86_64.AppImage']
}
cache_file = os.path.dirname(os.path.abspath(__file__)) + '/latest.json'


def redirect(url):
    headers = {
        'accept':
        'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    }
    res = requests.get(url, headers=headers)
    return res.url, res.ok


def download_file(url, local_filename=None, cmds=None):
    os.system(
        f'cd ~/.local/bin && /usr/bin/aria2c --allow-overwrite=true {url} -o {local_filename} && chmod +x {local_filename}'
    )
    if cmds:
        os.system('cd ~/.local/bin && ' + cmds)


try:
    with open(cache_file, 'r') as f:
        latest_ver = json.load(f)
except FileNotFoundError:
    latest_ver = {}

# print(latest_ver)

for app, info in apps.items():
    if len(info) == 3:
        repo, bin_name, cmds = info
    else:
        repo, bin_name = info
        cmds = None

    url = 'https://github.com/' + repo

    latest_0 = f'{url}/releases/latest'
    latest, ok = redirect(latest_0)

    if not ok:
        print(f'{latest_0} not found')
        continue
    # print(latest)

    tag = latest.split('/')[-1]
    if (app in latest_ver) and latest_ver.get(app) == tag:
        print(f'{app} is up to date')
        continue
    bin_url = f'{latest}/{bin_name}'.replace('tag', 'download')
    print(bin_url)
    download_file(bin_url, bin_name, cmds)
    print(f'{app} is updated to {tag}')
    latest_ver[app] = tag

with open(cache_file, 'w') as f:
    json.dump(latest_ver, f, indent=2)
