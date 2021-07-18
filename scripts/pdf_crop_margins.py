#!/usr/bin/env zsh
import os
import argparse


def crop(pdf):

    os.system(f'pdf-crop-margins -v "{pdf}" -o "temp.pdf"')
    os.remove(pdf)
    os.rename('temp.pdf', pdf)


parser = argparse.ArgumentParser()
parser.add_argument('input', type=str, help='input file or directory')
parser.add_argument('-t', '--times', help='Cropped times', type=int)
arg = parser.parse_args()

n = 4   # Default
if arg.times:
    n = arg.times

# Abspath of input
abspath = os.path.realpath(arg.input)

if os.path.isfile(arg.input):
    os.chdir(os.path.dirname(abspath))
    for _ in range(n):
        crop(arg.input)

if os.path.isdir(arg.input):
    os.chdir(abspath)
    file_list = os.listdir()
    for item in file_list:
        if item.startswith('.'):
            file_list.remove(item)
    file_list.sort()
    for item in file_list:
        for _ in range(n):
            crop(item)
