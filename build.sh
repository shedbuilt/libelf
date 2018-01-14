#!/bin/bash
./configure --prefix=/usr || return 1
make -j $SHED_NUMJOBS || return 1
make DESTDIR="$SHED_FAKEROOT" -C libelf install || return 1
install -v -Dm644 config/libelf.pc "${SHED_FAKEROOT}/usr/lib/pkgconfig/libelf.pc"
