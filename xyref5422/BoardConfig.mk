#
# Copyright (C) 2011 The Android Open-Source Project
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
#

# These two variables are set first, so they can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := true

TARGET_LINUX_KERNEL_VERSION := 3.10

TARGET_BOARD_INFO_FILE := device/samsung/xyref5422/board-info.txt

# HACK : To fix up after bring up multimedia devices.
TARGET_SOC := exynos5422

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOOTLOADER_BOARD_NAME := xyref5422

# SMDK common modules
BOARD_SMDK_COMMON_MODULES := liblight
BOARD_EGL_CFG := device/samsung/xyref5422/conf/egl.cfg

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Storage options
BOARD_USES_SDMMC_BOOT := false

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14994636800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_MOUNT_SDCARD_RW := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

# HACK : to fixup build
WPA_SUPPLICANT_VERSION := VER_0_8_X

# CAMERA
BOARD_BACK_CAMERA_ROTATION := 90
BOARD_FRONT_CAMERA_ROTATION := 270
BOARD_BACK_CAMERA_SENSOR := SENSOR_NAME_S5K2P2
BOARD_FRONT_CAMERA_SENSOR := SENSOR_NAME_S5K6B2
BOARD_CAMERA_DISPLAY_WQHD := false

# HWCServices
BOARD_USES_HWC_SERVICES := true

#G3D
#It is enabled because the MIXER supports only HAL_PIXEL_FORMAT_BGRA_8888.
BOARD_USE_BGRA_8888 := true

# HDMI
BOARD_USES_GSC_VIDEO := true
BOARD_USES_CEC := true

# GSC
BOARD_USES_ONLY_GSC0_GSC1 := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true
BOARD_USES_FIMGAPI_V4L2 := false
# SCALER
BOARD_USES_SCALER := true

# Keymaster
BOARD_USES_TRUST_KEYMASTER := false
