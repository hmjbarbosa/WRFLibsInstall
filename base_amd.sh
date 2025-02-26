# Remember to load the AMD modules
# module load aocc/5.0.0
#
export comp='amd' 
export base=/storage/WRF/Libs/aocc-5.0.0
export amdopt=' -std=gnu99  -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-implicit-function-declaration -Wno-incompatible-function-pointer-types -Wno-unused-command-line-argument -Wno-deprecated-non-prototype -Wno-strict-prototypes -fPIC -fPIE -O2 '

# MPICH needs "asm" which is a gnu extension. So we should
# use -std=gnu99 instead of -std=c99

#-O2 -std=gnu89 
#-m64
#-no-prec-div
#-xHost
#-static-intel
#-std=c89'

export CC='clang'
export CFLAGS=$amdopt

export CXX='clang++'
# -DINTEL_COMPILER -DpgiFortran -Df2cFortran 
export CXXFLAGS=' -DpgiFortran '
export CPPFLAGS=$CXXFLAGS

export F77='flang'
export FFLAGS=

export FC='flang'
export F90='flang'
export FCFLAGS=

export CPP='clang -E'
export CXXCPP='clang++ -E'

#
# Make sure the compilers can be accessed
TMP=`which ${CC} `; if [ ! -f "$TMP" ] ; then echo "Not found CC=$TMP"; exit; fi
TMP=`which ${CXX}`; if [ ! -f "$TMP" ] ; then echo "Not found CXX=$TMP"; exit; fi
TMP=`which ${F77}`; if [ ! -f "$TMP" ] ; then echo "Not found F77=$TMP"; exit; fi
TMP=`which ${F90}`; if [ ! -f "$TMP" ] ; then echo "Not found F90=$TMP"; exit; fi
TMP=`which ${FC} `; if [ ! -f "$TMP" ] ; then echo "Not found FC=$TMP"; exit; fi
#
# For AMD, double-check they point to something from AMD
TMP=`which ${CC} `; if [ -z `echo $TMP | grep -i -e amd -e aocc` ] ; then echo "CC=$TMP is not from AMD!"; exit; fi
TMP=`which ${CXX}`; if [ -z `echo $TMP | grep -i -e amd -e aocc` ] ; then echo "CXX=$TMP is not from AMD!"; exit; fi
TMP=`which ${F77}`; if [ -z `echo $TMP | grep -i -e amd -e aocc` ] ; then echo "F77=$TMP is not from AMD!"; exit; fi
TMP=`which ${F90}`; if [ -z `echo $TMP | grep -i -e amd -e aocc` ] ; then echo "F90=$TMP is not from AMD!"; exit; fi
TMP=`which ${FC} `; if [ -z `echo $TMP | grep -i -e amd -e aocc` ] ; then echo "FC=$TMP is not from AMD!"; exit; fi
#
