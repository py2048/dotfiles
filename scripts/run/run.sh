#!/usr/bin/env bash

export LC_NUMERIC="en_US.UTF-8"
start=$(date +%s.%N)

finish() {
    end=$(date +%s.%N)
    dtime=$(printf %.3f "$(bc <<<"$end - $start")")
    echo "[Finished in ${dtime}s]"

}

CC=${CC:-cc}
CXX=${CXX:-c++}
FF=${FF:-ifort}
F90=${F90:-gfortran}
PY=${PY:-python3}
SH=${SH:-zsh}
CD=${CD:-false}
JL=${JL:-julia}

# src=$(realpath "$1")
[[ "$1" == *"/"* ]] && src="$1" || src=./"$1"
base="${src%.*}"
ext="${src##*.}"


shebang=$(head -1 "$src")
sb=$(cut -c 1-2 <<< "$shebang")
! [ -z "$sb" ] && [ "$sb" = "#!" ] && eval "${shebang##*!} \"$src\"" && finish && exit

case $ext in
    c)
        $CC "$src" -o "$base" && "$base"
        ;;
    cpp|c++)
        $CXX "$src" -o "$base" && "$base"
        ;;
    f)
        $FF "$src" -o "$base" && "$base"
        ;;
    f90|f95|f03|f08)
        $F90 "$src" -o "$base" && "$base"
        ;;
    py)
        $PY -u "$src"
        ;;
    jl)
        $JL "$src"
        ;;
    sh)
        $SH "$src"
        ;;
    *)
        echo Cannot execute
        ;;
esac

finish
