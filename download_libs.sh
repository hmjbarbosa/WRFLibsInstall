# https://home.hiroshima-u.ac.jp/~leehs/?page_id=5612

mkdir -p Downloads
cd Downloads

# zlib
#wget https://zlib.net/zlib-1.2.5.tar.gz
#wget https://zlib.net/zlib-1.2.7.tar.gz
wget https://zlib.net/zlib-1.3.1.tar.gz

# jpeg
wget https://www.ijg.org/files/jpegsrc.v8d.tar.gz
#wget https://www.ijg.org/files/jpegsrc.v9f.tar.gz

# szip
wget https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz

# libpng
wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.39.tar.gz
#wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.43.tar.gz

# jasper
wget https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.2.tar.gz
#wget https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.29.tar.gz

# mpich
#wget https://www.mpich.org/static/downloads/3.0.4/mpich-3.0.4.tar.gz
#wget https://www.mpich.org/static/downloads/4.0.3/mpich-4.0.3.tar.gz
wget https://www.mpich.org/static/downloads/4.2.2/libpmi-4.2.2.tar.gz

# hdf5
#wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.6/src/hdf5-1.8.6.tar.gz
#wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.22/src/hdf5-1.8.22.tar.gz
#wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.1/src/hdf5-1.12.1.tar.gz

# curl
wget https://curl.se/download/curl-7.76.1.tar.gz

# netcdf-c
#wget https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.8.1.tar.gz 
wget https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.2.tar.gz
tmp=`/bin/ls v?.?.?.tar.gz`; mv $tmp netcdf-c-$tmp 

# netcdf-fortran
wget https://downloads.unidata.ucar.edu/netcdf-fortran/4.6.1/netcdf-fortran-4.6.1.tar.gz
#wget https://downloads.unidata.ucar.edu/netcdf-fortran/4.8.1/netcdf-fortran-4.8.1.tar.gz


version_cunit="2.1-2"

wget http://downloads.sourceforge.net/project/cunit/CUnit/${version_cunit}/CUnit-${version_cunit}-src.tar.bz2

export LD_LIBRARY_PATH="/home/hslee/Downloads/wrf_libs_intel/CUnit/2.1-2/lib:$LD_LIBRARY_PATH"


version_udunits="2.2.28"
#wget https://artifacts.unidata.ucar.edu/repository/downloads-udunits/udunits-${version_udunits}.tar.gz
wget https://downloads.unidata.ucar.edu/udunits/${version_udunits}/udunits-${version_udunits}.tar.gz

export UDUNITS2_XML_PATH="/home/hslee/Downloads/wrf_libs_intel/udunits/2.2.28/share/udunits/udunits2.xml"
export PATH="/home/hslee/Downloads/wrf_libs_intel/udunits/2.2.28/bin:$PATH"


