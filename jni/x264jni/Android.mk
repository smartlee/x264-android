LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
TARGET_ARCH_ABI :=armeabi-v7a
LOCAL_MODULE    := x264
APP_PLATFORM :=android-9
#include $(LOCAL_PATH)/config.maxport 
TMPDIR="/home/lee/temp/android"
NDKROOT="/home/lee/android-ndk-r8"
PREBUILT=$(NDKROOT)/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86
PLATFORM=$(NDKROOT)/platforms/android-9/arch-arm
LOCAL_SRC_FILES :=  x264.c.neon common/pixel.c.neon common/macroblock.c.neon \
       common/frame.c.neon common/dct.c.neon common/cpu.c.neon common/cabac.c.neon \
       common/common.c.neon common/osdep.c.neon common/rectangle.c.neon \
       common/set.c.neon common/quant.c.neon common/deblock.c.neon common/vlc.c.neon \
       common/mvpred.c.neon common/bitstream.c.neon common/predict.c.neon common/mc.c.neon\
       encoder/analyse.c.neon encoder/me.c.neon encoder/ratecontrol.c.neon \
       encoder/set.c.neon encoder/macroblock.c.neon encoder/cabac.c.neon \
       encoder/cavlc.c.neon encoder/encoder.c.neon encoder/lookahead.c.neon\
       input/input.c.neon input/timecode.c.neon input/raw.c.neon input/y4m.c.neon \
       output/raw.c.neon output/matroska.c.neon output/matroska_ebml.c.neon \
       output/flv.c.neon output/flv_bytestream.c.neon filters/filters.c.neon \
       filters/video/video.c.neon filters/video/source.c.neon filters/video/internal.c.neon \
       filters/video/resize.c.neon filters/video/cache.c.neon filters/video/fix_vfr_pts.c.neon \
       filters/video/select_every.c.neon filters/video/crop.c.neon filters/video/depth.c.neon\
       common/threadpool.c input/thread.c common/arm/mc-c.c.neon common/arm/predict-c.c.neon\
       common/arm/cpu-a.S.neon common/arm/pixel-a.S.neon common/arm/mc-a.S.neon \
       common/arm/dct-a.S.neon common/arm/quant-a.S.neon common/arm/deblock-a.S.neon \
       common/arm/predict-a.S.neon
       
LOCAL_CFLAGS += -std=gnu99 -I$PLATFORM/usr/include -fPIC -mfpu=neon  -march=armv7-a -mtune=cortex-a8 -msoft-float  -O3 -fomit-frame-pointer -fno-strict-aliasing   -Wa,--noexecstack -MMD -MP 
LOCAL_CFLAGS += -pthread
LOCAL_ARM_NEON  := true
#LOCAL_ARM_MODE  := arm 
LOCAL_LDLIBS :=  -Wl,-T,$(PREBUILT)/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,-rpath-link=$(PLATFORM)/usr/lib -L$(PLATFORM)/usr/lib -nostdlib $(PREBUILT)/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtbegin.o $(PREBUILT)/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtend.o -lc -lm -ldl -lgcc 
include $(BUILD_SHARED_LIBRARY)
