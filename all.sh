#!/bin/bash

# Wait before calling the script for each library?
export WAITCLICK=1

# create a LOG file for each install script? 
export LOG=1

# Loop over the libraries that need to be installed
# NOTE: Do not change the order! Some of the libraries depend on
#       the successful installation of previous libraries.
libs='  zlib
	jpeg
	szip
	libpng
	jasper
	netcdf-c_clean
	netcdf-fortran_clean
	mpich
	hdf5
	pnetcdf
	netcdf-c
	netcdf-fortran'

for lib in $libs ; do

    echo "==================================== $lib ====================================="
    if (( $WAITCLICK )) ; then
	echo "Press 'n' to skip, 'q' to quit, anything else to continue "
	read -p "compile $lib? " -n1 
	if [[ "$REPLY" == "N" || "$REPLY" == "n" ]]; then
	    echo
	    continue
	elif [[ "$REPLY" == "Q" || "$REPLY" == "q" ]]; then
	    echo
	    break
	fi
    fi

    # call the install script, with or without LOG
    if (( $LOG )) ; then
	./${lib}.sh | tee ${lib}.log 
    else
	./${lib}.sh
    fi
    
done
#
