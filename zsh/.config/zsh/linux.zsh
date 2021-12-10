# Aliases
# Open in linux
alias open='xdg-open'

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

# Set PATH for paraview
add_path ~/Apps/paraview_exec/bin

# Plugins

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fzf
load_file ~/.config/fzf/general.zsh
load_file ~/.config/fzf/key-bindings.zsh

# Activate conda environment
conda()
{
    load_file ~/.miniconda3/etc/profile.d/conda.sh
    conda activate base
    [ -z "$1" ] || conda $@
}
