# WRF Libs Install

This is a set of shell scripts to install the libraries needed for the
WRF and other atmospheric models and tools. In a nutshell, there is:

- one config script for each compiler (gcc, amd, intel)
- one install script for each library that calls the config script
- one main script that calls all of install scripts. 

## Usage

First, link the correct config script for your case. For instance, to
compile using gcc you should:

```
ln -s base_gcc.sh base.sh
```

Second, run the main script:

```
./all.sh
```

By default, the script will stop and wait for confirmation before
proceeding with each library. You can edit the script and set `export
WAITCLICK=0` if you don't want the interruptions. In that case, you
might want to `export LOG=1` so that the output of the installation of
each library goes into a .log file.

## Libraries

Currently, these are the libraries that get compiled, with their
dependencies:

- zlib (1.3.1)
- jpeg (8d)
- szip (2.1.1)
- libpng (1.6.39)
  - zlib
- jasper (1.900.1)
  - jpeg
- mpich (4.2.2)
- hdf5 (1.14.4-3)
  - mpich
  - zlib
  - szip
- pnetcdf (1.13.0)
  - mpich
- netcdf-c (4.9.2)
  - hdf5
  - mpich
  - zlib
  - szip
- netcdf-fortran (4.6.1)
  - netcdf-c
  - mpich
  - hdf5
  - zlib
  - szip


To compile everything, just call the main:

```
./all.sh
```

Config files are provide for gcc, amd, and intel compilers:

- base



