# Remember to load the INTEL modules
# module load intel/compiler/latest
#
export comp='intel'
export base=/storage/WRF/Libs/oneapi-2024.2.1
export intelopt=' -std=gnu99 -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-implicit-function-declaration -Wno-incompatible-function-pointer-types -Wno-unused-command-line-argument -Wno-deprecated-non-prototype -Wno-strict-prototypes -fPIC -fPIE -O2'
#  -mcmodel=large

# MPICH needs "asm" which is a gnu extension. So we should
# use -std=gnu99 instead of -std=c99

#-O2
#-m64
#-no-prec-div
#-xHost
#-static-intel
#-std=c89'
#-fPIC -fPIE

export CC='icx'
export CFLAGS=$intelopt

export CXX='icpx'
# -DINTEL_COMPILER -DpgiFortran -Df2cFortran 
export CXXFLAGS=' -DpgiFortran '
export CPPFLAGS=$CXXFLAGS
# export CPPFLAGS="-DNDEBUG -DpgiFortran ${LDFLAGS}"

export F77='ifx '
export FFLAGS=

export FC='ifx '
export F90='ifx '
export FCFLAGS=

#export CPP='icc -E -mcmodel=large'
#export CXXCPP='icpc -E -mcmodel=large'
export CPP='icx -E'
export CXXCPP='icpx -E'

#
# Make sure the compilers can be accessed
TMP=`which ${CC} `; if [ ! -f "$TMP" ] ; then echo "Not found CC=$TMP"; exit; fi
TMP=`which ${CXX}`; if [ ! -f "$TMP" ] ; then echo "Not found CXX=$TMP"; exit; fi
TMP=`which ${F77}`; if [ ! -f "$TMP" ] ; then echo "Not found F77=$TMP"; exit; fi
TMP=`which ${F90}`; if [ ! -f "$TMP" ] ; then echo "Not found F90=$TMP"; exit; fi
TMP=`which ${FC} `; if [ ! -f "$TMP" ] ; then echo "Not found FC=$TMP"; exit; fi
#
# For INTEL, double-check they point to something from INTEL
TMP=`which ${CC} `; if [ -z `echo $TMP | grep -i -e intel -e oneapi` ] ; then echo "CC=$TMP is not from INTEL!"; exit; fi
TMP=`which ${CXX}`; if [ -z `echo $TMP | grep -i -e intel -e oneapi` ] ; then echo "CXX=$TMP is not from INTEL!"; exit; fi
TMP=`which ${F77}`; if [ -z `echo $TMP | grep -i -e intel -e oneapi` ] ; then echo "F77=$TMP is not from INTEL!"; exit; fi
TMP=`which ${F90}`; if [ -z `echo $TMP | grep -i -e intel -e oneapi` ] ; then echo "F90=$TMP is not from INTEL!"; exit; fi
TMP=`which ${FC} `; if [ -z `echo $TMP | grep -i -e intel -e oneapi` ] ; then echo "FC=$TMP is not from INTEL!"; exit; fi
#
