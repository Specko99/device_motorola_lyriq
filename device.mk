#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/lyriq

# API
PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_TARGET_VNDK_VERSION := 35

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    product \
    vendor \
    odm \
    odm_dlkm \
    vbmeta \
    vendor_boot \
    vendor_dlkm \
    vbmeta_system \
    vbmeta_vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES += \
    bootctrl.mt6893

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

