#
. base.sh

tag='9f'
cd Build
rm -Rf jpeg-${tag}
tar -xzvf ../Downloads/jpegsrc.v${tag}.tar.gz
cd jpeg-${tag}

./configure --prefix=${base}/jpeg --enable-shared

make -j 4 
make check
make install
#
