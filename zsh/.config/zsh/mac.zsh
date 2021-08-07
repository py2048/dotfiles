# Set PATH
# Homebrew sbin
add_path /usr/local/sbin
# pip
add_path $HOME/Library/Python/3.9/bin
# Mac OS coreutils
add_path /usr/local/opt/coreutils/libexec/gnubin


# Aliases
# Drag and drop in MacOS
alias dr="open -a /Applications/Dropover.app/Contents/MacOS/Dropover"


# Plugins

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fzf
load_file ~/.fzf.zsh

# Activate conda environment
conda()
{
    load_file /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh
    conda activate base
    [ -z "$1" ] || conda $@
}
