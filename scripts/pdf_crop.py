#!/usr/bin/env python
import sys
import os
import copy
import PyPDF2


CROP = [
    {
        'lowleft': (0, 426.2),
        'upright': (612, 840)
    },
    {
        'lowleft': (0, 840),
        'upright': (612, 1224)
    },
    # {
    # 'lowleft': (398, 398.9),
    # 'upright': (612, 1224)
    # }
]


def main(item_pdf, CROP):
    input_pdf = os.path.basename(item_pdf)
    output_pdf = os.path.splitext(input_pdf)[0] + '_edited.pdf'
    with open(input_pdf, 'rb') as src:
        with open(output_pdf, 'wb') as dst:
            r_input = PyPDF2.PdfFileReader(src)
            w_output = PyPDF2.PdfFileWriter()

            for p in range(0, r_input.getNumPages()):
                p_0 = r_input.getPage(p)

                for i in CROP:
                    p_new = copy.copy(p_0)
                    p_new.mediaBox = copy.copy(p_0.mediaBox)
                    p_new.mediaBox.lowerLeft = i['lowleft']
                    p_new.mediaBox.upperRight = i['upright']

                    w_output.addPage(p_new)
            w_output.write(dst)
    print("Done!")


if __name__ == "__main__":
    # dirpath = os.path.dirname(os.path.abspath(sys.argv[1]))
    # os.chdir(dirpath)
    item_pdf = sys.argv[1]
    main(item_pdf, CROP)
