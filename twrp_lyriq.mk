#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
# Configure launch_with_vendor_ramdisk.mk
# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from lyriq device
$(call inherit-product, device/motorola/lyriq/device.mk)

PRODUCT_DEVICE := lyriq
PRODUCT_NAME := twrp_lyriq
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 40
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lyriq_g-user 15 V1TLS35.73-60-3-6 4b84db-3efd0 release keys"

BUILD_FINGERPRINT := motorola/lyriq_g/lyriq:15/V1TLS35.73-60-3-6/4b84db-3efd0:user/release-keys
