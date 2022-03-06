# Aliases
# Open in linux
open() {
    nohup xdg-open "$@" > $HOME/.cache/xdg-open.log &
}

# FEAP alias
alias feap=~/FEAP/ver84/main/feap
# alias clean_feap='find . -type f ! -name "*.f" ! -name "*.sh" | xargs rm -r && rm -r E* FE*'

# Set env for intel compilers
export FEAPHOME8_4=$HOME/FEAP/ver84
export FEAPPVHOME5_1=$HOME/FEAP/feappv
load_file /opt/intel/oneapi/compiler/latest/env/vars.sh
load_file /opt/intel/oneapi/mkl/latest/env/vars.sh
load_file /opt/intel/oneapi/mpi/latest/env/vars.sh
export I_MPI_F90=ifort
export I_MPI_F77=ifort
export I_MPI_FC=ifort
export I_MPI_CC=icc
export I_MPI_CXX=icpc

# Julia
alias jl="julia -J$HOME/.local/lib/jlrepl -J$HOME/.local/lib/jlplots"

# Set PATH for paraview
add_path ~/Apps/paraview_exec/bin

# pacman cleanup

clean_pacman() {
    local orphan=$(pacman -Qdtq)
    [ -z "$orphan" ] || sudo pacman -Rsn $(pacman -Qdtq)
}

# Plugins

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate conda environment
conda()
{
    if [ -f "~/.miniconda3/etc/profile.d/conda.sh" ]; then
        source ~/.miniconda3/etc/profile.d/conda.sh
    elif [ -f "/opt/intel/oneapi/intelpython/latest/env/vars.sh" ]; then
        source /opt/intel/oneapi/intelpython/latest/env/vars.sh
    fi
  
    conda activate base
    [ -z "$1" ] || conda $@
}
