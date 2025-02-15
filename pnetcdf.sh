#
. base.sh

tag='1.13.0'
cd Build
rm -Rf pnetcdf-${tag}
tar -xzvf ../Downloads/pnetcdf-${tag}.tar.gz
cd pnetcdf-${tag}

export PATH="${base}/mpich/bin:${PATH}"
export MPICC=${base}/mpich/bin/mpicc
export MPICXX=${base}/mpich/bin/mpic++
export MPIF77=${base}/mpich/bin/mpif77
export MPIF90=${base}/mpich/bin/mpif90
export MPIFV=${base}/mpich/bin/mpif90

./configure --prefix=${base}/netcdf \
    --with-mpi=${base}/mpich --enable-shared --enable-static

if (( $WAITCLICK )) ; then read -p "pnetcdf: compile? " -n1 -s ; fi
make -j 10

if (( $WAITCLICK )) ; then read -p "pnetcdf: check? " -n1 -s ; fi
make -j 10 check

if (( $WAITCLICK )) ; then read -p "pnetcdf: install? " -n1 -s ; fi
make ptests

if (( $WAITCLICK )) ; then read -p "pnetcdf: check install? " -n1 -s ; fi
make install

#
