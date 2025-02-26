#
. base.sh

tag='1.900.29'
cd Build
rm -Rf jasper-${tag}
tar -xzvf ../Downloads/jasper-${tag}.tar.gz
cd jasper-${tag}

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${base}/jpeg/lib
export LDFLAGS="${LDFLAGS} -L${base}/jpeg/lib"
export CPPFLAGS="${CPPFLAGS} -I${base}/jpeg/include"

#export PATH="${base}/mpich/bin:${PATH}"
#export CC=${base}/mpich/bin/mpicc
#export CXX=${base}/mpich/bin/mpicxx
#export FC=${base}/mpich/bin/mpif90
#export F77=${base}/mpich/bin/mpif77
#export F90=${base}/mpich/bin/mpif90

autoreconf -i -f
./configure --prefix=${base}/jasper --enable-shared --enable-static
automake -a -f

make -j 4
make check
make install
#
