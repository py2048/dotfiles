#!/usr/bin/env python
import os
import sys
import shutil
import PyPDF2
import copy
import math


def flist():
    '''
    File list \n
    Return all non-hidden files in current directory as a list
    '''
    file_list = os.listdir()
    for item in file_list:
        if item.startswith('.'):
            file_list.remove(item)
    file_list.sort()
    return file_list


# Horizontal slice
n_h = 2
# Vertical slice
n_v = 2


# Change to the directory to the input's dir
dirpath = os.path.realpath(sys.argv[1])
os.chdir(dirpath)
pdf_list = flist()  # List of all pdf files need to be slice

# Create an directory for original file
if os.path.exists("Original"):
    shutil.rmtree("Original")
os.makedirs("Original")
o_path = os.path.join(dirpath, "Original")

# Execute
for item_pdf in pdf_list:
    input_pdf = os.path.basename(item_pdf)
    output_pdf = os.path.splitext(input_pdf)[0] + '_edited.pdf'
    with open(input_pdf, 'rb') as src:
        with open(output_pdf, 'wb') as dst:
            r_input = PyPDF2.PdfFileReader(input_pdf)
            w_output = PyPDF2.PdfFileWriter()

            for p in range(r_input.getNumPages()):
                p_0 = r_input.getPage(p)

                x1, y1 = p_0.mediaBox.lowerLeft
                x2, y2 = p_0.mediaBox.upperRight

                coor = []
                for m in range(n_h + 1):
                    coor.append([])
                    for n in range(n_v + 1):
                        coor_x = math.floor(m * (x2 - x1) / n_v)
                        coor_y = math.floor(n * (y2 - y1) / n_h)
                        coor[m].append((coor_x, coor_y))

                for j in reversed(range(n_v)):
                    for i in range(n_h):
                        p_new = copy.copy(p_0)
                        p_new.mediaBox = copy.copy(p_0.mediaBox)
                        p_new.mediaBox.lowerLeft = coor[i][j]
                        p_new.mediaBox.upperRight = coor[i + 1][j + 1]

                        w_output.addPage(p_new)

            w_output.write(dst)

    shutil.move(os.path.join(dirpath, item_pdf),
                os.path.join(o_path, item_pdf))

print("Done!")
