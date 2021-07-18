#!/usr/bin/env zsh
if [[ "$1" = "--help" || -z $1 ]]; then
    echo "usage: encrypt.sh FILE "
    exit
fi

ABSPATH=$(realpath $1)
DIRPATH=$(dirname ${ABSPATH})
BASENAME=$(basename ${ABSPATH})
ext=${BASENAME##*.}
if [[ ${ext} = enc ]]; then
    TYPE="d"
    echo "Decrypting..."
else
    TYPE="e"
    echo "Encrypting..."
fi
cd ${DIRPATH}
if [[ ${TYPE} = e ]]; then
    if [[ -d $1 ]]; then
        zip -r -X ${BASENAME}".z" ${BASENAME}
        OUTPUT=${BASENAME}".z.enc"
        BASENAME=${OUTPUT:0:-4}
    else
        OUTPUT=${BASENAME}".enc"
    fi
elif [[ ${TYPE} = d ]]; then
    OUTPUT=${BASENAME:0:-4}
fi

openssl enc -aes-256-cbc -${TYPE} -in ${BASENAME} -out ${OUTPUT}

if [[ ${TYPE} = d && ${OUTPUT: -2} = ".z" ]]; then
    unzip ${OUTPUT}
    rm ${OUTPUT}
elif [[ ${BASENAME: -2} = ".z" ]]; then
    rm ${BASENAME}
fi
