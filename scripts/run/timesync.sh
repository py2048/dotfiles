#!/usr/bin/env bash

warp-svc > /dev/null &
pid=$!

ntpdate arch.pool.ntp.org && echo Sync time successfully
kill $pid

