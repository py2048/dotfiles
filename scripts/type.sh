#!/usr/local/bin/zsh
ABSPATH=$(realpath $0)
DIRPATH=$(dirname ${ABSPATH})
echo ${ABSPATH}
echo ${DIRPATH}
if [[ -d $1 ]]; then
    echo "dir"
elif [[ -f $1 ]]; then
    echo "file"
else
    echo "invalid"
fi
