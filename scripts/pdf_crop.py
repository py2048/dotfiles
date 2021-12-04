#!/usr/bin/env python
import sys
import os
import json
import copy
import PyPDF2
import numpy as np

CROP_0 = [
    {
        "lowleft": [0, 0],
        "upright": [0.5, 1]
    },
    {
        "lowleft": [0.5, 0],
        "upright": [1, 1]
    },
]


def crops(js):
    if not os.path.exists(js):
        return CROP_0
    with open(js) as f:
        crop = json.load(f)
    return crop


def main(item_pdf, js):
    # input_pdf = os.path.basename(item_pdf)
    input_pdf = item_pdf
    output_pdf = os.path.splitext(input_pdf)[0] + '_cropped.pdf'
    with open(input_pdf, 'rb') as src:
        with open(output_pdf, 'wb') as dst:
            r_input = PyPDF2.PdfFileReader(src)
            w_output = PyPDF2.PdfFileWriter()

            for p in range(0, r_input.getNumPages()):
                p_0 = r_input.getPage(p)
                pdim = np.array(p_0.mediaBox, dtype=np.float64)[[2, 3]]

                for c in crops(js):
                    p_new = copy.copy(p_0)
                    p_new.mediaBox = copy.copy(p_0.mediaBox)
                    p_new.mediaBox.lowerLeft = np.array(c['lowleft']) * pdim
                    p_new.mediaBox.upperRight = np.array(c['upright']) * pdim

                    w_output.addPage(p_new)
            w_output.write(dst)
    print("Done!")


if __name__ == "__main__":
    # dirpath = os.path.dirname(os.path.abspath(sys.argv[1]))
    # os.chdir(dirpath)
    item_pdf = sys.argv[1]
    js = sys.argv[2] if len(sys.argv) > 2 else 'crop.json'

    main(item_pdf, js)
