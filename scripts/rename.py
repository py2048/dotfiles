#!/usr/bin/env python
import os
import sys

if len(sys.argv) != 2:
    print('Usage: rename.py ext')
    sys.exit()

ext = sys.argv[1]

files = [f for f in os.listdir() if f.split(
    '.')[-1] == ext and f.split('.')[0].isnumeric()]
n = len(max(files, key=len)) - len(ext) - 1

for f in files:
    os.rename(f, f"{f.split('.')[0].zfill(n)}.{ext}")
