#
. base.sh

tag='1.6.39'
cd Build
rm -Rf libpng-${tag}
tar -xzvf ../Downloads/libpng-${tag}.tar.gz
cd libpng-${tag}

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${base}/zlib/lib
export LDFLAGS="${LDFLAGS} -L${base}/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I${base}/zlib/include"

#export PATH="${base}/mpich/bin:${PATH}"
#export CC=${base}/mpich/bin/mpicc
#export CXX=${base}/mpich/bin/mpicxx
#export FC=${base}/mpich/bin/mpif90
#export F77=${base}/mpich/bin/mpif77
#export F90=${base}/mpich/bin/mpif90

autoreconf -i -f
./configure --prefix=${base}/libpng  --enable-shared --with-zlib-prefix=${base}/zlib
automake -a -f

make -j 4
make check
make install
#
