#!/bin/bash

mkdir builddir
cd builddir

if [ `uname` == Darwin ]; then
#make clean
#rm CMakeCache.txt

export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
  cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
  -D CMAKE_OSX_SYSROOT="/" \
  -D CMAKE_OSX_DEPLOYMENT_TARGET="" \
  -D CMAKE_VERBOSE_MAKEFILE=ON \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_SKIP_RPATH=ON \
  ..
else
  export LD_LIBRARY_PATH=$PREFIX/lib
  cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
  -D CMAKE_VERBOSE_MAKEFILE=ON \
  -D CMAKE_SKIP_RPATH=ON \
  ..
fi

make -j ${CPU_COUNT}
make install
