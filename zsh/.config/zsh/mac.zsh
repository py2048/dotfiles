# Set PATH
# Homebrew sbin
add_path /usr/local/sbin
# pip
add_path $HOME/Library/Python/3.9/bin
# Mac OS coreutils
add_path /usr/local/opt/coreutils/libexec/gnubin

# Paraview PATH
add_path /Applications/ParaView-5.9.1.app/Contents/bin


# ifort PATH
# if [ -d "/opt/intel/oneapi" ]; then
#     source /opt/intel/oneapi/compiler/latest/env/vars.sh
#     alias ifort='ifort -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib'
# fi

# Aliases
# Drag and drop in MacOS
alias dr="open -a /Applications/Dropover.app/Contents/MacOS/Dropover"

# rclonbe exclude .DS_Store
alias rclone='rclone --exclude ".DS_Store"'

# Recent mpv
mpv_rc() {
    tac ~/.cache/mpv_history | fzf | awk '{split($0,a,"] /"); print "/" a[2]}' | xargs -I {} open '{}'
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
