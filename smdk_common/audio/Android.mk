# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio.primary.$(TARGET_DEVICE)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SRC_FILES := \
	audio_hw.c \
	audio_route.c
LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	external/expat/lib \
	hardware/samsung_slsi/exynos/include \
	$(call include-path-for, audio-utils)
LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa libaudioutils libexpat
LOCAL_MODULE_TAGS := optional

ifeq ($(strip $(BOARD_USE_ALP_AUDIO)),true)
	LOCAL_CFLAGS += -DUSE_ALP_AUDIO
endif

ifeq ($(strip $(BOARD_USE_HDMI_AUDIO_ALWAYS)),true)
	LOCAL_CFLAGS += -DENABLE_HDMI_AUDIO_ALWAYS
endif

include $(BUILD_SHARED_LIBRARY)
