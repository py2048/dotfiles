#!/usr/bin/env zsh
# vm=$(ls ~/Parallels | sed -e 's/\.pvm$//' | /usr/local/bin/choose)
open /Applications/Parallels\ Desktop.app
# /usr/local/bin/prlctl start "$vm"
/usr/local/bin/prlctl start "$1"
