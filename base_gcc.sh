#
export comp='gcc'
export base=/storage/WRF/Libs/gcc_13.3.0

export CC=gcc
export CFLAGS=' -std=gnu99 -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-traditional -fPIC -fPIE -O2 '

#-O2  
#-m64 irrelevant for gcc
#-fpic only matters for shared libraries
#-std=c99 

export CXX=g++
# this is needed for netcdf-c when compiling with wrappers (like mpif90)
export CXXFLAGS=' -DgFortran ' 
export CPPFLAGS=$CXXFLAGS

export F77=gfortran
export FFLAGS=' -fallow-argument-mismatch '

export FC=gfortran
export F90=gfortran
export FCFLAGS=$FFLAGS

export CPP=cpp
export CXXCPP=cpp

# additional libraries that must be linked when compiling netcdf-c with gcc
export NCLIBS=' -lgfortran -lgcc -lm -ldl '

#
# Make sure the compilers can be accessed
TMP=`which ${CC} `; if [ ! -f "$TMP" ] ; then echo "CC=$CC is not in the PATH!"; exit; fi
TMP=`which ${CXX}`; if [ ! -f "$TMP" ] ; then echo "CXX=$CXX is not in the PATH!"; exit; fi
TMP=`which ${F77}`; if [ ! -f "$TMP" ] ; then echo "F77=$F77 is not in the PATH!"; exit; fi
TMP=`which ${F90}`; if [ ! -f "$TMP" ] ; then echo "F90=$F90 is not in the PATH!"; exit; fi
TMP=`which ${FC} `; if [ ! -f "$TMP" ] ; then echo "FC=$F90 is not in the PATH!"; exit; fi
#
