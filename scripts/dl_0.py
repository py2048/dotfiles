#!/usr/bin/env python
import os
import numpy as np

m3u8 = '/Users/minhquandoan/Downloads/f12bf8d1-15fd-4155-b2ab-0994e8fe9549.m3u8'
prefix = ''
file_name = 'Shiiba-san no Ura no Kao with Imouto Lip.mp4'

os.chdir('/Users/minhquandoan/Directory/temp')

with open(m3u8, 'r') as file_handle:
    lines = file_handle.read().splitlines()

i = 0
while True:
    if lines[i][0] != '#':
        break
    i += 1

l_file = ''

d_lines = np.arange(i, len(lines), 2)

k = 0

for part, chunk_part in enumerate(np.array_split(d_lines, 8)):
    with open(f'chunk_{part}.sh', 'w') as chunk_file:
        for d_line in chunk_part:
            temp = prefix + lines[d_line]
            media = f'media_{k:03d}.part'
            k += 1
            chunk_file.write(f'wget -q -O {media} {temp}\n')

with open('final.sh', 'w') as final:
    final.write('cat *.part > all.part\n')
    final.write(f'ffmpeg -i all.part -acodec copy -vcodec copy "{file_name}"\n')
    final.write('rm *.part')

os.system('zsh chunk_0.sh & zsh chunk_1.sh & zsh chunk_2.sh & zsh chunk_3.sh & zsh chunk_4.sh & zsh chunk_5.sh & zsh chunk_6.sh & zsh chunk_7.sh & ')
# os.system(f'cat *.part > all.part')
# os.system(f'ffmpeg -i all.part -acodec copy -vcodec copy "{file_name}"')
# os.system('rm *.part')
# os.system('rm wget-log*')
