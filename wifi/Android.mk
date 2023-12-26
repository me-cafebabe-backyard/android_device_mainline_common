#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_USES_COMMON_WIFI),generic)

WIFI_DRIVER_SOCKET_IFACE := wlan0
include external/wpa_supplicant_8/wpa_supplicant/wpa_supplicant_conf.mk

endif
