export CC=gcc
export march="armv8-a"
export flags="crypto+fp+simd+aes+sha2+crc"
export cpus="cortex-a53"
export CCFLAGS="-O3 -ffast-math -march=$march+$flags -mcpu=$cpus+$flags -mtune=$cpus -mabi=lp64 -DUSE_ASM -flax-vector-conversions -fno-strict-aliasing -fno-stack-protector -mno-strict-align -fomit-frame-pointer -fno-asynchronous-unwind-tables -fvisibility=hidden -ffunction-sections -fdata-sections -ftree-vectorize -ftree-loop-vectorize -ftree-slp-vectorize -fvect-cost-model=unlimited -msve-vector-bits=512 -fsimd-cost-model=unlimited -fopenmp -fopenmp-target-simd-clone=host -ftree-loop-optimize -ftree-loop-if-convert -fif-conversion -fif-conversion2 -faggressive-loop-optimizations -ftree-loop-distribution -ftree-loop-distribute-patterns -ftree-vrp -funroll-loops -fpeel-loops -fpredictive-commoning -fvariable-expansion-in-unroller -fexpensive-optimizations -funsafe-math-optimizations -fbranch-count-reg -fcprop-registers -finline-functions -fkeep-inline-functions -fkeep-static-functions -fkeep-static-consts -freorder-blocks -freorder-functions -fdevirtualize -fdevirtualize-at-ltrans -flto=4 -flto-compression-level=0 -fuse-linker-plugin"

# debugging
export FLAGS_DBG="-Og -flax-vector-conversions"

# exported process
export FLAGS="$CCFLAGS"
