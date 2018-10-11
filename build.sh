#!/bin/bash
# Configure
./configure --prefix=/usr &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" -C libelf install &&
install -v -Dm644 config/libelf.pc "${SHED_FAKE_ROOT}/usr/lib/pkgconfig/libelf.pc"
