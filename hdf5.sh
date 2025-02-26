#
. base.sh

#ver='1.8.6'
#ver='1.8.22'
#ver='1.12.2'
ver='1.14.4-3'
cd Build
rm -Rf hdf5-${ver}
tar -xzvf ../Downloads/hdf5-${ver}.tar.gz
cd hdf5-${ver}

# remove line that starts with C++ comments in C source code
#sed -i '/^\/\//d' tools/lib/h5tools_utils.c
#sed -i '/\/\/int/d' tools/lib/h5diff.c
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${base}/szip/lib:${base}/zlib/lib

#export LDFLAGS="${LDFLAGS} -L${base}/mpich/lib"
#export CPPFLAGS="${CPPFLAGS} -I${base}/mpich/include"
export PATH="${base}/mpich/bin:${PATH}"
export CC=${base}/mpich/bin/mpicc
export CXX=${base}/mpich/bin/mpicxx
export FC=${base}/mpich/bin/mpif90
export F77=${base}/mpich/bin/mpif77
export F90=${base}/mpich/bin/mpif90

# fix issue of -loopopt=0 confused with a library
# when using ifx (intel)
autoreconf -i -f

./configure --prefix=${base}/hdf5 \
   --with-zlib=${base}/zlib/include,${base}/zlib/lib \
   --with-szlib=${base}/szip \
   --enable-fortran --enable-shared \
   --enable-parallel --enable-hl

automake -a -f 

if (( $WAITCLICK )) ; then read -p "hdf5: compile? " -n1 -s ; fi
make -j 48

if (( $WAITCLICK )) ; then read -p "hdf5: check? " -n1 -s ; fi
make -j 48 check

if (( $WAITCLICK )) ; then read -p "hdf5: install? " -n1 -s ; fi
make install

if (( $WAITCLICK )) ; then read -p "hdf5: check install? " -n1 -s ; fi
make check-install

#

