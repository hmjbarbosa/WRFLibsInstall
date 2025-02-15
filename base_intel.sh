#
export comp='intel'
export base=/home/hbarbosa/WRF/Libs_intel

export CC='icx'
export CFLAGS=' -std=gnu89 -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-sign-conversion -Wno-implicit-function-declaration -Wno-incompatible-function-pointer-types -Wno-unused-command-line-argument '
#-O2
#-m64
#-no-prec-div
#-xHost
#-static-intel
#-std=c89'
#-fPIC -fPIE

export CXX='icpx'
# -DINTEL_COMPILER -DpgiFortran -Df2cFortran 
export CXXFLAGS=' -DpgiFortran '
export CPPFLAGS=$CXXFLAGS

export F77='ifx '
export FFLAGS=' -m64 '

export FC='ifx '
export F90='ifx '
export FCFLAGS=$FFLAGS

export CPP='icx -E'
export CXXCPP='icpx -E'
#
