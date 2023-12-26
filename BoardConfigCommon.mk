#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/mainline/common

# Bootloader
TARGET_NO_BOOTLOADER := true

# Graphics
TARGET_USES_VULKAN := true

# Platform
TARGET_BOARD_PLATFORM := mainline
BOARD_USES_MAINLINE_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# VINTF
DEVICE_MANIFEST_FILE += \
    $(COMMON_PATH)/vintf/common_media.xml \
    $(COMMON_PATH)/vintf/common_target_level_7.xml

ifeq ($(TARGET_USES_COMMON_AUDIO),minimal)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/vintf/common_audio_minimal.xml
endif
ifeq ($(TARGET_USES_COMMON_CAMERA),generic)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/vintf/common_camera_generic.xml
endif

ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/vintf/common_display_drm.xml
else
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/vintf/common_display_fb.xml
endif

# Wi-Fi
ifeq ($(TARGET_USES_COMMON_WIFI),generic)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
endif

# Inherit LineageOS value-adds
include $(COMMON_PATH)/BoardConfigCommonLineage.mk
