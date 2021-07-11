#!/usr/local/bin/python3.8
import os
from PyPDF2 import PdfFileMerger

dir_path = "."

pdfs = [
    '/Users/minhquandoan/Downloads/GT học phần Chủ nghĩa xã hội khoa học (K) Tr đầu -Tr66.pdf',
    '/Users/minhquandoan/Downloads/GT học phần Chủ nghĩa xã hội khoa học (K) Tr 67 -Tr144.pdf',
]

output = '/Users/minhquandoan/Downloads/GT học phần Chủ nghĩa xã hội khoa học.pdf'


def main(pdfs=pdfs, output=output):
    merger = PdfFileMerger()

    for files in pdfs:
        merger.append(files)

    merger.write(output)
    merger.close()


if __name__ == "__main__":
    os.chdir(dir_path)
    main()
