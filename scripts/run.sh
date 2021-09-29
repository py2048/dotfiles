#!/usr/bin/env zsh
start=$(date +%s.%N)

CC=${CC:-gcc-11}
CXX=${CXX:-g++-11}
FF=${FF:-ifort}
F90=${FF:-gfortran}
PY=${PY:-python3}
SH=${SH:-zsh}
CD=${CD:-false}

for item in "$@"; do
    [ "$item" = "-d" ] && CD=true && continue
    src=$(realpath "$item")
    base="${src%.*}"
    ext="${src##*.}"

    [ "$CD" = true ] && DIRN=$(dirname "$src") cd "$DIRN" && CD=false

    shebang=$(head -1 "$src")
    sb=$(cut -c 1-2 <<< "$shebang")
    [ -z "$sb" ] && [ "$sb" = "#!" ] && eval "${shebang##*!} \"$src\"" && continue

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
        sh)
            $SH "$src"
            ;;
        *)
            echo Cannot execute
            ;;
    esac
done

end=$(date +%s.%N)
dtime=$(printf %.3f $(( $end - $start )))
echo "[Finished in ${dtime}s]"
