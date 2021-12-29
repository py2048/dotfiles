#!/usr/bin/env zsh
# cd ~/Directory
INPUT=$(realpath $1)
echo ${INPUT}
while :
	do
	mkvmerge -i "${INPUT}"
	echo "\nSelect tracks to extract\n(Type nothing to exit)"
	read OUTPUT
	if [[ -z "$OUTPUT" ]]; then exit
	else
		mkvextract tracks "${INPUT}" "${OUTPUT}"
	fi
done
