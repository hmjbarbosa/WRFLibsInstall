#
. base.sh

#tag=3.0.4
#tag=4.0.3
tag='4.2.2'
cd Build
rm -Rf mpich-${tag}
tar -xzvf ../Downloads/mpich-${tag}.tar.gz
cd mpich-${tag}

#configure: error: F90 and F90FLAGS are replaced by FC and FCFLAGS
#respectively in this configure, please unset F90/F90FLAGS and set
#FC/FCFLAGS instead and rerun configure again.

#export FC=/opt/homebrew/bin/gfortran
#export F77=/opt/homebrew/bin/gfortran
#export CC=/opt/homebrew/bin/gcc-12
#export CXX=/opt/homebrew/bin/g++-12

#/opt/homebrew/bin/gcc-nm-12
#/opt/homebrew/bin/gcc-ar-12
#/opt/homebrew/bin/gcc-ranlib-12

#export CFLAGS=$CFLAGS' -fpic'
#export FFLAGS=$FFLAGS' -mabi=lp64 -fallow-argument-mismatch'
#export FCFLAGS=$FCFLAGS' -mabi=lp64 -fno-common'
#unset CFLAGS
#unset CXXFLAGS
#unset FFLAGS
#unset FCFLAGS
unset F90
#unset CPPFLAGS
#export LDSHARED=$CPP' -shared'

#-cflags="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"

autoreconf -i -f
./configure --prefix=${base}/mpich 
automake -a -f

make -j 10
make -j 10 check
make install
make installcheck

#
