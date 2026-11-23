export CC=gcc
export march="armv8-a"
export flags="crypto+simd+crc+sha2+aes"
export cpus="cortex-a53"
#export FLAGS_D="-O3 -DUSE_ASM -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -fuse-linker-plugin -funroll-loops -fomit-frame-pointer -ftree-loop-if-convert-stores -fvisibility=hidden -flax-vector-conversions -flto=4 -flto-compression-level=0 -mno-strict-align -fasynchronous-unwind-tables -ftree-vectorize --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 -fpeel-loops -ffinite-loops -ffinite-math-only -fpredictive-commoning -ftree-loop-vectorize -ftree-slp-vectorize -fsched-spec-load -falign-functions=64 -falign-jumps=64 -falign-loops=64 -frename-registers -fallow-store-data-races -fvariable-expansion-in-unroller -floop-unroll-and-jam --param inline-unit-growth=120 --param large-function-growth=400 -faggressive-loop-optimizations -funsafe-math-optimizations"
#export FLAGS_T_DEFAULT="-O3 -DUSE_ASM -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -fuse-linker-plugin -funroll-loops -fomit-frame-pointer -ftree-loop-if-convert-stores -ftree-loop-if-convert -ftree-loop-optimize -floop-nest-optimize -fvisibility=hidden -flax-vector-conversions -flto=4 -flto-compression-level=0 -mno-strict-align -fno-strict-aliasing -fasynchronous-unwind-tables -ftree-vectorize --param=l1-cache-line-size=64 --param=l1-cache-size=32 --param=l2-cache-size=512 -fpeel-loops -ffinite-loops -ffinite-math-only -fpredictive-commoning -ftree-loop-vectorize -ftree-slp-vectorize -fsched-spec-load -falign-functions=64 -falign-jumps=64 -falign-loops=64 -frename-registers -fallow-store-data-races -fvariable-expansion-in-unroller -floop-unroll-and-jam --param inline-unit-growth=120 --param large-function-growth=400 -faggressive-loop-optimizations -ftree-loop-distribute-patterns -ftree-loop-distribution -fmove-loop-stores -funswitch-loops -ffunction-sections -fdata-sections -funsafe-math-optimizations"
#export FLAGS_T="-O3 -DUSE_ASM -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -fuse-linker-plugin -funroll-loops -fvariable-expansion-in-unroller -fpeel-loops -fpredictive-commoning -fsched-spec-load -fvisibility=hidden -flax-vector-conversions -flto=4 -flto-compression-level=0 -mno-strict-align -fno-strict-aliasing -fasynchronous-unwind-tables -ftree-vectorize -ftree-loop-vectorize -fvect-cost-model=unlimited -frename-registers -fmove-loop-stores -funswitch-loops -ffunction-sections -fdata-sections -ffinite-math-only"

# not optimized: -O0
export FLAGS_0="-O0 -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -flto=4 -flto-compression-level=0"
# standard optimized: -O2
export FLAGS_2="-O2 -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -flto=4 -flto-compression-level=0"
# high optimized: -O3
export FLAGS_3="-O3 -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -flto=4 -flto-compression-level=0"
# highly optimized: -O3 -ffast-math
export FLAGS_4="-O3 -ffast-math -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -flto=4 -flto-compression-level=0"
# highest non standard optimisation: -Ofast
export FLAGS_5="-Ofast -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -flto=4 -flto-compression-level=0"
# custom optimisation flags
export FLAGS_6="-O2 -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -fuse-linker-plugin -funroll-loops -fvariable-expansion-in-unroller -fpeel-loops -fpredictive-commoning -fvisibility=hidden -mno-strict-align -fno-strict-aliasing -fasynchronous-unwind-tables -ftree-vectorize -ftree-loop-vectorize -fvect-cost-model=unlimited -ffunction-sections -fdata-sections -flto=4 -flto-compression-level=0"
export FLAGS_7="-O3 -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -flax-vector-conversions -fuse-linker-plugin -funroll-loops -fvariable-expansion-in-unroller -fpeel-loops -fpredictive-commoning -fsched-spec-load -fvisibility=hidden -mno-strict-align -fno-strict-aliasing -fasynchronous-unwind-tables -ftree-vectorize -ftree-loop-vectorize -fvect-cost-model=unlimited -frename-registers -fmove-loop-stores -funswitch-loops -ffunction-sections -fdata-sections -ffinite-math-only -flto=4 -flto-compression-level=0"
# exported process

unset FLAGS
if [ ! -x stb-miner.0 ] && [ ! -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
	unset FLAGS
	export FLAGS="$FLAGS_0"
elif [ -x stb-miner.0 ] && [ ! -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
	unset FLAGS
	export FLAGS="$FLAGS_2"
elif [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
	unset FLAGS
	export FLAGS="$FLAGS_3";
elif [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
	unset FLAGS
	export FLAGS="$FLAGS_4"
elif [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ -x stb-miner.3 ] && [ -x stb-miner.3-fast ] && [  ! -x stb-miner.fast ]; then
	unset FLAGS
	export FLAGS="$FLAGS_5"
	else
		if [ -x stb-miner.0 ] || [ -x stb-miner.2 ] || [ -x stb-miner.3 ] || [ -x stb-miner.3-fast ] || [ -x stb-miner.fast ]; then
			echo "[01;31merror[0m: stb-miner.0, stb-miner.2, stb-miner.3, stb-miner.3-fast, and stb-miner.fast is allready exist."
			exit 1
	fi
fi

export PKG_CONFIG_PATH=/usr/local/deps/lib/pkgconfig
export CFLAGS="$FLAGS"
export CXXFLAGS="$FLAGS"
export CPPFLAGS="-I/usr/local/deps/include"
export TEST_LDFLAGS="-Wl,--reduce-memory-overheads -Wl,-O1 -Wl,--gc-sections -Wl,-z,now -Wl,-z,relro"
export LDFLAGS="-L/usr/local/deps/lib -static $TEST_LDFLAGS -Wl,-flto=4 -Wl,-sv"
#export LDFLAGS="-L/usr/local/deps/lib -static $TEST_LDFLAGS -Wl,-sv"
export LIBS="-lcurl -lssl -lcrypto -lgmp"

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
		if [ ! -z "$FLAGS" ] && [ "`echo $FLAGS | grep -o O0`" = "O0" ] && [ ! -x stb-miner.0 ] && [ ! -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
			mv -v cpuminer stb-miner.0
		elif [ ! -z "$FLAGS" ] && [ "`echo $FLAGS | grep -o O2`" = "O2" ] && [ -x stb-miner.0 ] && [ ! -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
			mv -v cpuminer stb-miner.2
		elif [ ! -z "$FLAGS" ] && [ "`echo $FLAGS | grep -o O3`" = "O3" ] && [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ ! -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
			mv -v cpuminer stb-miner.3
		elif [ ! -z "$FLAGS" ] && [ "`echo $FLAGS | grep -o O4`" = "O4" ] && [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ -x stb-miner.3 ] && [ ! -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
			mv -v cpuminer stb-miner.3-fast
		elif [ ! -z "$FLAGS" ] && [ "`echo $FLAGS | grep -o O5`" = "O5" ] && [ -x stb-miner.0 ] && [ -x stb-miner.2 ] && [ -x stb-miner.3 ] && [ -x stb-miner.3-fast ] && [ ! -x stb-miner.fast ]; then
			mv -v cpuminer stb-miner.fast
			else
				echo "[01;32mDone...[0m"
				exit 1
			fi
		fi
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
