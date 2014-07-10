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

TARGET_BOARD_INFO_FILE := device/samsung/smdk5410/board-info.txt

TARGET_SOC := exynos5410

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOOTLOADER_BOARD_NAME := smdk5410

# bionic libc options
ARCH_ARM_USE_MEMCPY_ALIGNMENT := true
BOARD_MEMCPY_ALIGNMENT := 64
BOARD_MEMCPY_ALIGN_BOUND := 32768

# SMDK common modules
BOARD_SMDK_COMMON_MODULES := audio liblight

BOARD_EGL_CFG := device/samsung/smdk5410/conf/egl.cfg

# egl cache size : 256 * 1024
MAX_EGL_CACHE_SIZE := 262144

BOARD_USES_HGL := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

BOARD_USES_WQXGA_LCD := false

# Storage options
BOARD_USES_SDMMC_BOOT := false
BOARD_USES_WIFI := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 314572800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_MOUNT_SDCARD_RW := true

# Support RSC on PVR
BOARD_USES_PVR_RSC := true

# HACK : to fixup build
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Audio
BOARD_USE_ALP_AUDIO := true
BOARD_USE_HDMI_AUDIO_ALWAYS := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_CSC_HW := false
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_QOS_CTRL := false

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

#G3D
#[HACK] Currently, SGX supports only HAL_PIXEL_FORMAT_BGRA_8888.
BOARD_USE_BGRA_8888 := true

# [HACK] It will be removed after updating s3c-fb driver.
BOARD_USE_WAIT_DEQUEUE_FENCE := false

# [HACK] It will be removed after implementing FENCE SYNC.
BOARD_USE_FENCE_SYNC := true

# CAMERA
BOARD_BACK_CAMERA_ROTATION := 270
BOARD_FRONT_CAMERA_ROTATION := 90
BOARD_USE_MHB_ION := true

#SurfaceFlinger
BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# HWCServices
BOARD_USES_HWC_SERVICES := true
BOARD_USES_PRESENTATION_SUBTITLES := true
BOARD_USES_CEC := true

# HDMI
BOARD_USES_GSC_VIDEO := true

# FIMD
BOARD_USES_FB_PHY_LINEAR := false

