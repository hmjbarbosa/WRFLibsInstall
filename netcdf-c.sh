#
. base.sh

tag='4.9.2'
cd Build
rm -Rf netcdf-c-${tag}
tar -xzvf ../Downloads/netcdf-c-${tag}.tar.gz
cd netcdf-c-${tag}

export SZIPD=${base}/szip
export ZLIBD=${base}/zlib
export HDF5D=${base}/hdf5
export PNETC=${base}/netcdf
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SZIPD/lib:$ZLIBD/lib:$HDF5D/lib:$PNETC/lib

export CPPFLAGS=$CPPFLAGS" -I${PNETC}/include -I${HDF5D}/include -I${SZIPD}/include -I${ZLIBD}/include "
export LDFLAGS=$LDFLAGS" -L${PNETC}/lib -L${HDF5D}/lib -L${SZIPD}/lib -L${ZLIBD}/lib "
export LIBS="-lhdf5_hl -lhdf5 -lsz -lz -lpnetcdf $NCLIBS"

export PATH="${base}/mpich/bin:${PATH}"
export CC=${base}/mpich/bin/mpicc
export CXX=${base}/mpich/bin/mpicxx
export FC=${base}/mpich/bin/mpif90
export F77=${base}/mpich/bin/mpif77
export F90=${base}/mpich/bin/mpif90

autoreconf -i -f

./configure --prefix=${base}/netcdf \
	    --enable-netcdf-4 --enable-shared \
	    --enable-netcdf4 --enable-static --enable-pnetcdf --enable-cdf5 \
	    --enable-parallel-tests --enable-hdf5
#--disable-dap
automake -a -f 

if (( $WAITCLICK )) ; then read -p "netcdf-c: compile? " -n1 -s ; fi
make -j 10

if (( $WAITCLICK )) ; then read -p "netcdf-c: check? " -n1 -s ; fi
make -j 10 check

if (( $WAITCLICK )) ; then read -p "netcdf-c: install? " -n1 -s ; fi
make install

#
