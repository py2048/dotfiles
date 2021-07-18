#!/usr/bin/env zsh
start=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time')

in=""

CC=gcc-11
CXX=g++-11
FF=gfortran


for item in "$@"; do
    abspath=$(realpath ${item})
    dirpath=$(dirname ${item})
    file=$(basename ${abspath})
    base="${file%.*}"
    ext="${file##*.}"


    case ${ext} in
        c)
            $CC ${file} -o ${base} ${in}
            ./${base}
            ;;
        cpp)
            $CXX ${file} -o ${base} ${in}
            ./${base}
            ;;
        #f)
            #ifort ${file} -o ${base} ${in}
            #./${base}
            #;;
        f|f90|f95|f08)
            $FF ${file} -o ${base} ${in}
            ./${base}
            ;;
        ipynb)
            jupyter lab
            ;;
        py)
            python -u ${file} ${in}
            ;;
        sh)
            ./${file}
            ;;
    esac
done

end=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time')
dtime=$(printf %.3f $(( $end - $start )))
echo "[Finished in ${dtime}s]"
