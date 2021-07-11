#!/usr/bin/env python
import os

# m3u8 = '/Users/minhquandoan/Downloads/a4bd7947-3bde-474a-bfb7-6007f759e828.m3u8'
# prefix = ''
# file_name = 'Iizuka-senpai x Blazer Ane Kyun Yori Animation 01.mp4'
# ext = 'png'

m3u8 = input('PATH of m3u8 file: ').strip()
prefix = input('URL prefix: ')
file_name = input('Output file name: ')

# print(m3u8)
# print(prefix)
# print(file_name)

os.chdir('/Users/minhquandoan/Directory/temp')
os.system(f'aria2c -x 8 -s 8 -k 1M -i {m3u8}')

with open(m3u8, 'r') as file_handle:
    lines = file_handle.read().splitlines()
    ext = ''
    for l in lines:
        if l[0] != "#":
            ext = l.split('.')[-1]
            break

if not ext:
    ext = 'ts'

if prefix:
    with open(m3u8, 'r') as file_handle:
        lines = file_handle.read().splitlines()

    for l in lines:
        if l[0] != "#":
            l = prefix + l
    with open(m3u8, 'w') as file_handle:
        file_handle.write('\n'.join(lines))


files = [f for f in os.listdir() if f.split(
    '.')[-1] == ext and f.split('.')[0].isnumeric()]
n = len(max(files, key=len)) - len(ext) - 1

for f in files:
    os.rename(f, f"{f.split('.')[0].zfill(n)}.{ext}")

os.system(f'cat *.{ext} > all.{ext}')
os.system(
    f'ffmpeg -i all.{ext} -acodec copy -vcodec copy "{file_name}"')
