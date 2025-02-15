#!/bin/bash
export WAITCLICK=0
export LOG=1
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile zlib? " -n1 -s ; fi
if (( $LOG )) ; then
    ./zlib.sh > zlib.log 2>&1
else
    ./zlib.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile jpeg? " -n1 -s ; fi
if (( $LOG )) ; then
    ./jpeg.sh > jpeg.log 2>&1
else
    ./jpeg.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile szip? " -n1 -s ; fi
if (( $LOG )) ; then
    ./szip.sh > szip.log 2>&1
else
    ./szip.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile libpng? " -n1 -s ; fi
if (( $LOG )) ; then
    ./libpng.sh > libpng.log 2>&1
else
    ./libpng.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile jasper? " -n1 -s ; fi
if (( $LOG )) ; then
    ./jasper.sh > jasper.log 2>&1
else
    ./jasper.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile mpich? " -n1 -s ; fi
if (( $LOG )) ; then
    ./mpich.sh > mpich.log 2>&1
else
    ./mpich.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile netcdf-c clean (no hdf5, pnetcdf, ...)? " -n1 -s ; fi
if (( $LOG )) ; then
    ./netcdf-c_clean.sh > netcdf-c_clean.log 2>&1
else
    ./netcdf-c_clean.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile netcdf-fortran clean (no hdf5, pnetcdf, ...)? " -n1 -s ; fi
if (( $LOG )) ; then
    ./netcdf-fortran_clean.sh > netcdf-fortran_clean.log 2>&1
else
    ./netcdf-fortran_clean.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile hdf5? " -n1 -s ; fi
if (( $LOG )) ; then
    ./hdf5.sh > hdf5.log 2>&1
else
    ./hdf5.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile parallel-netcdf? " -n1 -s ; fi
if (( $LOG )) ; then
    ./pnetcdf.sh > pnetcdf.log 2>&1
else
    ./pnetcdf.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile netcdf-c? " -n1 -s ; fi
if (( $LOG )) ; then
    ./netcdf-c.sh > netcdf-c.log 2>&1
else
    ./netcdf-c.sh
fi
#
echo "======================================================="
if (( $WAITCLICK )) ; then read -p "compile netcdf-fortran? " -n1 -s ; fi
if (( $LOG )) ; then
    ./netcdf-fortran.sh > netcdf-fortran.log 2>&1
else
    ./netcdf-fortran.sh
fi
#
