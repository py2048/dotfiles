#!/usr/bin/env bash

cc -O2 check_src_bin.c -o check_src_bin

for f in run.sh run.lua check_src_bin jl timesync.sh enable_libvirt.sh; do
    sudo ln -sfn $(realpath "$f") /usr/local/bin
done


