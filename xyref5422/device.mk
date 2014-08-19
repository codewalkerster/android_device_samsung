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
LOCAL_KERNEL := device/samsung/xyref5422/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk

# These are for the multi-storage mount.
ifeq ($(BOARD_USES_SDMMC_BOOT),true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/conf/vold.fstab.sdboot:system/etc/vold.fstab \

DEVICE_PACKAGE_OVERLAYS := \
	device/samsung/xyref5422/overlay-sdboot
else
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/conf/vold.fstab:system/etc/vold.fstab \

DEVICE_PACKAGE_OVERLAYS := \
	device/samsung/xyref5422/overlay-emmcboot
endif

# Init files
ifeq ($(BOARD_USES_SDMMC_BOOT),true)
PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/conf/init.xyref5422.rc:root/init.xyref5422.rc \
	device/samsung/xyref5422/conf/init.xyref5422.usb.rc:root/init.xyref5422.usb.rc \
	device/samsung/xyref5422/conf/fstab.xyref5422.sdboot:root/fstab.xyref5422
else
PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/conf/init.xyref5422.rc:root/init.xyref5422.rc \
	device/samsung/xyref5422/conf/init.xyref5422.usb.rc:root/init.xyref5422.usb.rc \
	device/samsung/xyref5422/conf/fstab.xyref5422:root/fstab.xyref5422
endif

PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/conf/ueventd.xyref5422.rc:root/ueventd.xyref5422.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

# audio
PRODUCT_PACKAGES += \
	audio.primary.xyref5422 \
	audio.a2dp.default \
	audio.usb.default \
	tinyplay \
	tinymix \
	tinycap

# audio mixer paths
PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/audio_policy.conf:system/etc/audio_policy.conf

# Libs
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# for now include gralloc here. should come from hardware/samsung_slsi/exynos5
PRODUCT_PACKAGES += \
	gralloc.exynos5

PRODUCT_PACKAGES += \
	libion

PRODUCT_PACKAGES += \
	camera.xyref5422

# Video Editor
PRODUCT_PACKAGES += \
	VideoEditorGoogle

# Misc other modules
PRODUCT_PACKAGES += \
	lights.xyref5422

# MobiCore setup
PRODUCT_PACKAGES += \
	libMcClient \
	libMcRegistry \
	libgdmcprov \
	mcDriverDaemon

# WideVine modules
PRODUCT_PACKAGES += \
	com.google.widevine.software.drm.xml \
	com.google.widevine.software.drm \
	WidevineSamplePlayer \
	libdrmwvmplugin \
	libwvm \
	libWVStreamControlAPI_L1 \
	libwvdrm_L1

# WideVine DASH modules
PRODUCT_PACKAGES += \
	libwvdrmengine

# WideVine DRM setup
PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/xyref5422/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/xyref5422/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := phone

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5422/exynos5422-vendor.mk)

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi/exynos5422/exynos5422.mk)
