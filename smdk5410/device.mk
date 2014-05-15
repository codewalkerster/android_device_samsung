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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/smdk5410/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk

# These are for the multi-storage mount.
ifeq ($(BOARD_USES_SDMMC_BOOT),true)
#	SD/MMC boot
	DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-sdboot
	source_vold_fstab_file := $(LOCAL_PATH)/conf/vold.fstab.sdboot
else
#	eMMC boot (default)
	DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-emmcboot
	ifeq ($(BOARD_USES_WIFI),true)
#		WIFI is enabled
		source_vold_fstab_file := $(LOCAL_PATH)/conf/vold.fstab.wifi
	else
#		WIFI is disabled (default)
		source_vold_fstab_file := $(LOCAL_PATH)/conf/vold.fstab
	endif
endif
PRODUCT_COPY_FILES += $(source_vold_fstab_file):system/etc/vold.fstab

# Init files
ifeq ($(BOARD_USES_SDMMC_BOOT),true)
PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/conf/init.smdk5410.rc.sdboot:root/init.smdk5410.rc \
	device/samsung/smdk5410/conf/init.smdk5410.usb.rc:root/init.smdk5410.usb.rc \
	device/samsung/smdk5410/conf/fstab.smdk5410.sdboot:root/fstab.smdk5410
else
PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/conf/init.smdk5410.rc:root/init.smdk5410.rc \
	device/samsung/smdk5410/conf/init.smdk5410.usb.rc:root/init.smdk5410.usb.rc \
	device/samsung/smdk5410/conf/fstab.smdk5410:root/fstab.smdk5410
endif

PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/conf/ueventd.smdk5410.rc:root/ueventd.smdk5410.rc

# Generated kcm keymaps
PRODUCT_PACKAGES := \
	samsung-keypad.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

# audio
PRODUCT_PACKAGES += \
	audio.primary.smdk5410 \
	audio.a2dp.default \
	audio.usb.default

# audio mixer paths
PRODUCT_COPY_FILES += \
	device/samsung/smdk_common/audio/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
	camera.$(TARGET_BOOTLOADER_BOARD_NAME)

# Libs
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Video Editor
PRODUCT_PACKAGES += \
	VideoEditorGoogle

# Misc other modules
PRODUCT_PACKAGES += \
	lights.smdk5410

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/smdk5410/media_codecs.xml:system/etc/media_codecs.xml

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/samsung/smdk5410/mxt540e_i2c.idc:system/usr/idc/mxt540e_i2c.idc \
	device/samsung/smdk5410/pixcir_ts.idc:system/usr/idc/pixcir_ts.idc

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# WQXGA_LCD
ifeq ($(BOARD_USES_WQXGA_LCD),true)
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
else
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

PRODUCT_CHARACTERISTICS := phone

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=128m
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
endif

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exists, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5410/exynos5410-vendor.mk)
