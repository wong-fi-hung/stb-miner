#!/bin/bash

source GCC_FLAGS.sh
export PKG_CONFIG_PATH=/usr/local/deps/lib/pkgconfig
export CFLAGS="$FLAGS"
export CXXFLAGS="$FLAGS"
export CPPFLAGS="-I/usr/local/deps/include"
export TEST_LDFLAGS="-Wl,--reduce-memory-overheads -Wl,-O1 -Wl,--gc-sections -Wl,-z,now -Wl,-z,relro"
export LDFLAGS="-L/usr/local/deps/lib -static $TEST_LDFLAGS -Wl,-flto=4 -Wl,-s"
export LIBS="-lcurl -lcares -lssl -lcrypto -lgmp"

clean() {
	clear
	make clean distclean
	rm -rvf autom4te.cache/ compile config.guess config.sub configure configure~ depcomp install-sh Makefile.in missing m4
}
if [ "$1" = "clean" ]; then
	clear
	clean
	exit 1
elif [ "$1" = "conf_make" ]; then
	clear
	./configure --with-curl CC=$CC CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" LIBS="$LIBS"
	make -j4
elif [ "$1" = "make" ]; then
	clear
	make -j4
	exit 1
elif [ "$1" = "rebuild" ]; then
	clear
	clean
	mkdir m4
	autoreconf -if
	./configure --with-curl CC=$CC CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" LIBS="$LIBS"
	make -j4
	exit 1
elif [ "$1" = "first_build" ]; then
	clear
	autoreconf -if
	./configure --with-curl CC=$CC CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" LIBS="$LIBS"
	make -j4
	exit 1
else
	if [ "$1" = "" ]; then
		echo " option are: "
		echo "             clean               clean build tree."
		echo "             conf_make           configure and make in build tree."
		echo "             make                build target package."
		echo "             rebuild             build all target from first."
		echo "             first_build         firstly build package."
	fi
fi
