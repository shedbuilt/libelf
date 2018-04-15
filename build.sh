#!/bin/bash
./configure --prefix=/usr || return 1
make -j $SHED_NUM_JOBS || return 1
make DESTDIR="$SHED_FAKE_ROOT" -C libelf install || return 1
install -v -Dm644 config/libelf.pc "${SHED_FAKE_ROOT}/usr/lib/pkgconfig/libelf.pc"
