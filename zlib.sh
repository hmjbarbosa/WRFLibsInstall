#
. base.sh 

tag='1.3.1'
cd Build
rm -Rf zlib-${tag}
tar -xzvf ../Downloads/zlib-${tag}.tar.gz
cd zlib-${tag}

./configure --prefix=${base}/zlib --static --shared

make -j 4
make check
make install
#
