#!/bin/bash
# Patch for GCC 8.x compilation
sed -e '/ALIGN_PRSTATUS)/{
        s/__attribute/attribute_packed &/
        s/packed, //}' \
    -i backends/linux-core-note.c &&
# Configure
./configure --prefix=/usr &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" -C libelf install &&
install -v -Dm644 config/libelf.pc "${SHED_FAKE_ROOT}/usr/lib/pkgconfig/libelf.pc"
