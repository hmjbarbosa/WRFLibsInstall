#
. base.sh

tag='4.9.2'
cd Build
rm -Rf netcdf-c-${tag}
tar -xzvf ../Downloads/netcdf-c-${tag}.tar.gz
cd netcdf-c-${tag}

autoreconf -i -f

./configure --prefix=${base}/netcdf_clean \
	    --disable-netcdf-4 --disable-dap \
	    --disable-plugins --disable-byterange \
	    --disable-zstandard-plugin --disable-libxml2 --disable-quantize
# --disable-hdf5 
#	    --disable-nczarr-filters --disable-nczarr \
#	    --disable-parallel4 --enable-netcdf4 --enable-netcdf-4
#--disable-libxml2 --disable-dap-remote-tests \
#	    --disable-byterange 
#
#

automake -a -f 

if (( $WAITCLICK )) ; then read -p "netcdf-c_clean: compile? " -n1 -s ; fi
make -j 10

if (( $WAITCLICK )) ; then read -p "netcdf-c_clean: check? " -n1 -s ; fi
make -j 10 check

if (( $WAITCLICK )) ; then read -p "netcdf-c_clean: install? " -n1 -s ; fi
make install

#
