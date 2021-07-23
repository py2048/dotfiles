#!/usr/bin/env zsh
export PETSC_DIR=$HOME/FEAP/petsc
export PETSC_ARCH=intel_opt
./configure --prefix=petsc-lib --with-mpi-dir=/opt/intel/oneapi/mpi/latest --with-blaslapack-dir=/opt/intel/oneapi/mpi/latest/ --with-scalapack-include=/opt/intel/oneapi/mpi/latest/ --with-scalapack-lib="-L/opt/intel/oneapi/mkl/latest/lib/intel64 -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64" --download-metis --download-mumps
