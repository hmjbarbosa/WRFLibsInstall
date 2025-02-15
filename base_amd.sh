#
export comp='amd' 
export base=/storage/WRF/Libs/aocc-5.0.0
export amdopt=' -std=gnu99  -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-implicit-function-declaration -Wno-incompatible-function-pointer-types -Wno-unused-command-line-argument -Wno-deprecated-non-prototype -fPIC -fPIE -O2 '

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
export FFLAGS=$amdopt

export FC='flang'
export F90='flang'
export FCFLAGS=$amdopt

export CPP='clang -E'
export CXXCPP='clang++ -E'
#
