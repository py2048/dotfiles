#!/usr/bin/env zsh

dt=1

size() {
    du -s ~/Downloads | cut -f1
}


PID=$(pgrep "caffeinate")

if [ -z "$PID" ]; then
    echo Running
    caffeinate -i > /dev/null 2>&1 &
    check1=$(size)
    while :
    do
        sleep $dt
        check2=$(size)
        echo $check1
        echo $check2
        if (( $(( $check2 - $check1 )) == 0 )); then
            echo Stopped
            echo ${PID}
            # kill ${PID}
            exit
        fi
        check1=$check2
        echo 1
    done<<<$(find tmp -type f)
else
    echo Stopped
    echo $PID
    # kill $PID
fi
