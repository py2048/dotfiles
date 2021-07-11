#!/usr/local/bin/zsh
start=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time')

for item in "$@"; do
    abspath=$(realpath ${item})
    dirpath=$(dirname ${item})
    file=$(basename ${abspath})
    base="${file%.*}"
    ext="${file##*.}"


    case ${ext} in
        c)
            gcc-10 ${file} -o ${base} 
            ./${base} < ./input.txt
            ;;
        cpp)
            clang++ ${file} -o ${base}
            ./${base} < ./input.txt
            ;;
        f|f90|f95|f08)
            gfortran ${file} -o ${base} 
            ./${base} < ./input.txt
            ;;
        ipynb)
            jupyter lab
            ;;
        py)
            python -u ${file} < ./input.txt
            ;;
        sh)
            ./${file}
            ;;
    esac
done

end=$(perl -MTime::HiRes=time -e 'printf "%.9f\n", time')
dtime=$(printf %.3f $(( $end - $start )))
echo "[Finished in ${dtime}s]"
