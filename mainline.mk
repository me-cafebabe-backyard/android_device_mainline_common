#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Flags
TARGET_BRINGUP_DEBUG ?= false
TARGET_DISPLAY_ENABLE_DRM ?= false

# dummy: HALs which does not provide any functionality, and are optional
# generic: HALs which works for generic hardwares
# minimal: HALs which provides none or minimal functionality, but required to boot
# Others: Not to use common configuration
TARGET_USES_COMMON_AUDIO ?= minimal
TARGET_USES_COMMON_CAMERA ?= generic
TARGET_USES_COMMON_GATEKEEPER ?= minimal
TARGET_USES_COMMON_KEYMASTER ?= minimal
TARGET_USES_COMMON_LIGHTS ?= dummy
TARGET_USES_COMMON_HEALTH ?= minimal
TARGET_USES_COMMON_POWER ?= minimal
TARGET_USES_COMMON_SENSORS ?= dummy
TARGET_USES_COMMON_THERMAL ?= minimal
TARGET_USES_COMMON_USB ?= generic
TARGET_USES_COMMON_WIFI ?= generic

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Properties
include $(LOCAL_PATH)/properties.mk

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Permissions (Misc)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml

# Audio
ifeq ($(TARGET_USES_COMMON_AUDIO),minimal)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/msd_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/msd_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/surround_sound_configuration_5_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_configuration_5_0.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml
endif

# Camera
ifeq ($(TARGET_USES_COMMON_CAMERA),generic)
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.v4l2

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml
endif

# Display
ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-V1-service.minigbm \
    android.hardware.graphics.mapper@4.0-impl.minigbm

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    hwcomposer.drm
else
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    gralloc.default

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.2-service
endif

PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.example

PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle \
    vulkan.pastel

PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Gatekeeper
ifeq ($(TARGET_USES_COMMON_GATEKEEPER),minimal)
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software
endif

# Health
ifeq ($(TARGET_USES_COMMON_HEALTH),minimal)
PRODUCT_PACKAGES += \
    android.hardware.health-service.cuttlefish \
    android.hardware.health-service.cuttlefish_recovery
else ifeq ($(TARGET_USES_COMMON_HEALTH),generic)
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery
endif

# Keymaster
ifeq ($(TARGET_USES_COMMON_KEYMASTER),minimal)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service
endif

# Lights
ifeq ($(TARGET_USES_COMMON_LIGHTS),dummy)
PRODUCT_PACKAGES += \
    android.hardware.lights-service.example
endif

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_sw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml

# Power
ifeq ($(TARGET_USES_COMMON_POWER),minimal)
PRODUCT_PACKAGES += \
    android.hardware.power-service.example \
    android.hardware.power.stats-service.example
endif

# Rootdir
PRODUCT_PACKAGES += \
    init.mainline.rc \
    init.mainline.usb.rc \
    init.recovery.mainline.rc \
    init.recovery.mainline.usb.rc \
    ueventd.mainline.rc

ifeq ($(TARGET_BRINGUP_DEBUG),true)
PRODUCT_PACKAGES += init.debug.rc
endif

# Sensors
ifeq ($(TARGET_USES_COMMON_SENSORS),dummy)
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.example
endif

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Thermal
ifeq ($(TARGET_USES_COMMON_THERMAL),minimal)
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.mock
endif

# USB
ifeq ($(TARGET_USES_COMMON_USB),generic)
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml
endif

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.example

# Wi-Fi
ifeq ($(TARGET_USES_COMMON_WIFI),generic)
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf
endif
