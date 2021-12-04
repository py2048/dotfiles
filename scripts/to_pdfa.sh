#!/usr/bin/env bash
gs -dPDFA -dBATCH -dNOPAUSE -sProcessColorModel=DeviceRGB -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=1 -sOutputFile="$2" "$1"
