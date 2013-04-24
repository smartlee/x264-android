#!/bin/bash
export TMPDIR="/home/lee/temp/android"
export NDKROOT="/home/lee/android-ndk-r8"
export PREBUILT=$NDKROOT/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86
export PLATFORM=$NDKROOT/platforms/android-9/arch-arm
export PATH=$PREBUILT/bin:$PATH

./configure --prefix=/home/lee/armlib \
    --libdir=/home/lee/armlib/lib \
    --includedir=/home/lee/armlib/include \
    --host=arm-linux \
	--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
	--extra-cflags="-I$PLATFORM/usr/include -ffast-math -fPIC -DANDROID  -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__  -Wno-psabi -mfpu=neon  -march=armv7-a -mtune=cortex-a8 -msoft-float -mthumb  -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -DANDROID  -Wa,--noexecstack -MMD -MP " \
    --disable-cli \
    --enable-shared \
    --enable-static \
    --enable-pic \
	--extra-ldflags="-Wl,-T,$PREBUILT/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtbegin.o $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtend.o -lc -lm -ldl -lgcc "
