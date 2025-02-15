#
. base.sh 

tag='2.1.1'
cd Build
rm -Rf szip-${tag}
tar -xzvf ../Downloads/szip-${tag}.tar.gz
cd szip-${tag}

autoreconf -i -f
./configure --prefix=${base}/szip --enable-shared --enable-static
automake -a -f 

make -j 4
make check
make install
#
