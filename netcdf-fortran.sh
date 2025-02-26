#
. base.sh

tag='4.6.1'
cd Build
rm -Rf netcdf-fortran-${tag}
tar -xzvf ../Downloads/netcdf-fortran-${tag}.tar.gz
cd netcdf-fortran-${tag}

export SZIPD=${base}/szip
export ZLIBD=${base}/zlib
export HDF5D=${base}/hdf5
export PNETC=${base}/netcdf
export NCDIR=${base}/netcdf
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SZIPD/lib:$ZLIBD/lib:$HDF5D/lib:$PNETC/lib:$NCDIR/lib

export CPPFLAGS=$CPPFLAGS" -I${NCDIR}/include -I${PNETC}/include -I${HDF5D}/include -I${SZIPD}/include -I${ZLIBD}/include "
export LDFLAGS=$LDFLAGS" -L${NCDIR}/lib -L${PNETC}/lib -L${HDF5D}/lib -L${SZIPD}/lib -L${ZLIBD}/lib ${NCLIBS}"

export LIBS=`${NCDIR}/bin/nc-config --libs`

export PATH="${base}/mpich/bin:${PATH}"
export CC=${base}/mpich/bin/mpicc
export CXX=${base}/mpich/bin/mpicxx
export FC=${base}/mpich/bin/mpif90
export F77=${base}/mpich/bin/mpif77
export F90=${base}/mpich/bin/mpif90

autoreconf -i -f
./configure --prefix=${NCDIR} \
	    --enable-shared --enable-static --enable-parallel-tests

# --enable-large-file-tests --with-pic
automake -a -f 

# For AMD
# https://github.com/Unidata/netcdf-fortran/issues/309
# libtool script has to be patched for flang (after configure) 
sed -i -e 's/wl=""/wl="-Wl,"/g' libtool

if (( $WAITCLICK )) ; then read -p "netcdf-fortran: compile? " -n1 -s ; fi
make -j 10

if (( $WAITCLICK )) ; then read -p "netcdf-fortran: check? " -n1 -s ; fi
make -j 10 check

if (( $WAITCLICK )) ; then read -p "netcdf-fortran: install? " -n1 -s ; fi
make install

#
