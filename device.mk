#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lyriq

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)


PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 35
BOARD_SHIPPING_API_LEVEL := 35

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
#PRODUCT_PACKAGES += \
#    android.hardware.health@2.1-impl \
#    android.hardware.health@2.1-service

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0

# Bootcontrol
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# TEST
PRODUCT_PACKAGES += \
    android.hardware.audio.core-V2-ndk \
    android.hardware.audio.common-V3-ndk \
    android.hardware.bluetooth.audio-V4-ndk \
    android.hardware.graphics.allocator-V2-ndk \
    android.hardware.graphics.common-V5-ndk

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V3-ndk \
    android.hardware.security.rkp-V3-ndk \
    android.hardware.security.secureclock-V1-ndk \
    android.hardware.security.sharedsecret-V1-ndk

# Sensors
#PRODUCT_PACKAGES += \
#    android.hardware.sensors-service.multihal \
#    android.hardware.sensors@2.0-subhal-impl-1.0

# DRM (Clearkey)
#PRODUCT_PACKAGES += \
#    com.android.hardware.drm.clearkey

# WiFi
#PRODUCT_PACKAGES += \
#    android.hardware.wifi-service \
#    wpa_supplicant

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_mtk.sh \
    apanic_save.sh \
    hardware_revisions.sh \
    init.insmod.sh \
    init.mmi.attest_model.sh \
    init.mmi.backup.trustlet.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.modem-rfs.sh \
    init.mmi.modules.sh \
    init.mmi.shutdown.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.oem.hw.sh \
    init.pstore_blk.sh \
    mot_rkp_csr_extraction.sh \
    pstore_annotate.sh \
    init.recovery.mt6893.rc

PRODUCT_PACKAGES += \
    fstab.enablezramwb \
    fstab.enablezram \
    fstab.mt6893 \
    fstab.enableswap\
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.mmi.backup.trustlet.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.sec.rc \
    init.mmi.tcmd.rc \
    init.mmi.usb.configfs.rc \
    init.modem.rc \
    init.mt6885.rc \
    init.mt6893.rc \
    init.mt6893.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init_conninfra.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6893:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6893

# Modules copy
#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilts/modules/vendor,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
#    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilts/modules/vendor_dlkm,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/lyriq/lyriq-vendor.mk)
