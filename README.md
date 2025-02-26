# WRF Libs Install

This is a set of shell scripts to install the libraries needed for the
WRF and other atmospheric models and tools. In a nutshell, there is:

- one config script for each compiler (gcc, amd, intel)
- one install script for each library that calls the config script
- one main script that calls all install scripts. 

## Usage

First, link the correct config script for your case. For instance, to
compile using gcc you should:

```
ln -s base_gcc.sh base.sh
```

Second, edit the config script and set the installation directory. It
is a good practice to include the compiler version on the directory
name, for instance:
```
export base=/storage/WRF/Libs/gcc_13.3.0 
```

Third, run the main script:

```
./all.sh
```

By default, the script will stop and wait for confirmation before
proceeding with each library. This is very helpfull for the first time
you are using the script, as you will be able to keep looking at the
compilation messages and detect any errors or weird warning messages
that might require your attention.

## Advanced usage

You can edit the main script and set
```
export WAITCLICK=0
```
if you don't want to be prompted before each installation. 

In that case, you might want to also set
```
export LOG=1
```

so the output of the installation of each library goes into a separate
.log file instead of the screen. Make sure to check all the log files
for error and warnings aftward!

Some of the libraries take a long time to compile, e.g., MPICH and
HDF5. If you want to see the content of the LOG file while the compilation is
on-going, you can use a different shell and do: 
```
tail -f hdf5.log
```

Remember, you can also call the installation scripts
individually. This is particularly useful for debuging, for instance,
if just one of the libraries is not compiling correclty in your
system:
```
./hdf5.sh
```

## AMD and INTEL

For AMD and INTEL compilers, make sure to have them loaded (i.e., available on your PATH) before running `all.sh` or any of the install scripts.

Depending on your system, you might need to load a module:
```
module load aocc/5.0.0
```

Or call a script:
```
source /opt/intel/oneapi/setvars.sh
```

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



