#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit from bismuth device
$(call inherit-product, device/oppo/CPH1859/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_CPH1859
PRODUCT_DEVICE := CPH1859
PRODUCT_BRAND := oppo
PRODUCT_MODEL := Realme 1
PRODUCT_MANUFACTURER := oppo

# Build info
BUILD_FINGERPRINT := "google/walleye/walleye:11/RP1A.201005.004/6782484:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=CPH1859 \
    PRODUCT_NAME=CPH1859 \
    PRIVATE_BUILD_DESC="full_oppo6771_17065-user 9 PPR1.180610.011 eng.root.20200509.060522 release-keys"
    
PRODUCT_GMS_CLIENTID_BASE := android-oppo
