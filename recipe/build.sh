#!/bin/bash

./bootstrap.sh

if [[ `uname` == 'Darwin' ]]; then
    # make check below fails on osx unless $PREFIX/lib is added to rpath
    LDFLAGS="$LDFLAGS -Wl,-rpath,${PREFIX}/lib"
fi

./configure --prefix=$PREFIX \
            --enable-applications \
            --enable-all \
            --enable-openmp \
            --with-fftw3-libdir=$PREFIX/lib \
            --with-fftw3-includedir=$PREFIX/include \
            --with-window=kaiserbessel

make
make check
make install
