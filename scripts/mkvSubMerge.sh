#!/usr/bin/env zsh
if [[ "$1" = "--help" || -z $3 ]]; then
    echo "mkvSubMerge.sh [mkvPATH] [subPATH] {language [vi] OR [eng])}"
    exit
fi

INPUT=$(realpath $1)
FILE=$(basename $1)
SUB=$(realpath $2)
LANGUAGE="$3"
echo "Enter track name (optional)"
read NAME
cd ~/Directory
mkvmerge -o ${FILE} ${INPUT} --language 0:${LANGUAGE} --track-name 0:${NAME} ${SUB}
