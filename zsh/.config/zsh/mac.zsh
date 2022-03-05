# Set PATH
# Homebrew sbin
add_path /usr/local/sbin
# Mac OS coreutils
add_path /usr/local/opt/coreutils/libexec/gnubin

# Add curl PATH
add_path /usr/local/opt/curl/bin

# Paraview PATH
add_path /Applications/ParaView*.app/Contents/bin


# Aliases
# Drag and drop in MacOS
alias dr="open -a /Applications/Dropover.app/Contents/MacOS/Dropover"

# rclonbe exclude .DS_Store
alias rclone='rclone --exclude ".DS_Store"'

# Julia
alias jl="julia -J$HOME/.local/lib/jlrepl -J$HOME/.local/lib/jlplots"

# Dust
alias dust='dust -H'

# Python installed dir
export PYTHONUSERBASE="$HOME/.local"

# Scan QR
function scan_qr() {
  local result=""
  while true; do
    imagesnap -q -w 1 /tmp/snap.jpg
    result="$(zbarimg -1 --raw -q -Sbinary /tmp/snap.jpg)"
    [[ -n $result ]] && break
    sleep 1
  done
  echo "${result}"
}

# Plugins

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate conda environment
conda()
{
    load_file /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh
    conda activate base
    [ -z "$1" ] || conda $@
}
