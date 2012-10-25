# Makefile for Android to build fb2png
#
# Copyright (C) 2012  Kyan <kyan.ql.he@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

LOCAL_PATH:= $(call my-dir)

# We need to build this for both the device (as a shared library)
# and the host (as a static library for tools to use).

# <-- Build libfb2png
include $(CLEAR_VARS)

# LOCAL_STATIC_LIBRARIES := libc libstdc++ libpng libz liblog
LOCAL_SHARED_LIBRARIES := libc libstdc++ libpng libz liblog

LOCAL_C_INCLUDES += external/zlib external/libpng 

LOCAL_MODULE := libfb2png
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	fb2png.c \
	img_process.c \
	fb.c
LOCAL_CFLAGS += -DANDROID

include $(BUILD_STATIC_LIBRARY)
# -->


# <-- Build fb2png bin
include $(CLEAR_VARS)

LOCAL_MODULE := fb2png
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := main.c
LOCAL_STATIC_LIBRARIES += libfb2png
LOCAL_SHARED_LIBRARIES := liblog libpng
LOCAL_C_INCLUDES += libpng/include

include $(BUILD_EXECUTABLE)
# -->


# <-- Build jni wrapper
include $(CLEAR_VARS)

LOCAL_MODULE := libfb2png-jni
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := fb2png-jni.c
LOCAL_STATIC_LIBRARIES := libfb2png

include $(BUILD_SHARED_LIBRARY)
# -->

