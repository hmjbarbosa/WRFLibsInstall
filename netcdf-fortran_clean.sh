#
. base.sh

tag='4.6.1'
cd Build
rm -Rf netcdf-fortran-${tag}
tar -xzvf ../Downloads/netcdf-fortran-${tag}.tar.gz
cd netcdf-fortran-${tag}

export NCDIR=${base}/netcdf_clean

export LIBS=`${NCDIR}/bin/nc-config --libs`

autoreconf -i -f

./configure --prefix=${NCDIR} \
	    --disable-shared --disable-f03-compiler-check --disable-f03
# --disable-nczarr-filters
automake -a -f 

# For AMD
# https://github.com/Unidata/netcdf-fortran/issues/309
# libtool script has to be patched for flang (after configure) 
sed -i -e 's/wl=""/wl="-Wl,"/g' libtool

if (( $WAITCLICK )) ; then read -p "netcdf-fortran_clean: compile? " -n1 -s ; fi
make -j 10

if (( $WAITCLICK )) ; then read -p "netcdf-fortran_clean: check? " -n1 -s ; fi
make -j 10 check

if (( $WAITCLICK )) ; then read -p "netcdf-fortran_clean: install? " -n1 -s ; fi
make install

#
