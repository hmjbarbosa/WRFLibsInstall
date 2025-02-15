#
export comp='gcc'
export base=/storage/WRF/Libs_gcc

export CC=gcc
export CFLAGS=' -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-traditional -fPIC -fPIE -O3 '

#-O2  
#-m64 irrelevant for gcc
#-fpic only matters for shared libraries
#-std=c99 

export CXX=g++
export CXXFLAGS=' -DgFortran ' 
export CPPFLAGS=$CXXFLAGS

export F77=gfortran
export FFLAGS=' -fallow-argument-mismatch '

export FC=gfortran
export F90=gfortran
export FCFLAGS=$FFLAGS

export CPP=cpp
export CXXCPP=cpp


#
