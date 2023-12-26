#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Product: ADB on boot
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1 \
    persist.service.debuggable=1 \
    persist.service.adb.enable=1

# Vendor: ADB
PRODUCT_VENDOR_PROPERTIES += \
    persist.adb.nonblocking_ffs=0 \
    ro.adb.nonblocking_ffs=0

# Vendor: Camera
ifeq ($(TARGET_USES_COMMON_CAMERA),generic)
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.camera=v4l2
endif

# Vendor: DRM
PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Vendor: Graphics
PRODUCT_VENDOR_PROPERTIES += \
    debug.hwui.renderer=skiagl \
    debug.sf.disable_hwc_overlays=1 \
    debug.sf.no_hw_vsync=1 \
    ro.hardware.egl=angle \
    ro.hardware.vulkan=pastel \
    ro.opengles.version=196609

ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.hwcomposer=drm
endif

# Vendor: Wi-Fi
ifeq ($(TARGET_USES_COMMON_WIFI),generic)
PRODUCT_VENDOR_PROPERTIES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15
endif
