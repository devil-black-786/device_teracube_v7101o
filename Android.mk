#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),v7101o)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

GATEKEEPER_SYMLINKS := $(TARGET_OUT_VENDOR)
$(GATEKEEPER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating gatekeeper symlinks: $@"
	@mkdir -p $@/lib/hw
	@mkdir -p $@/lib64/hw
	@ln -sf libSoftGatekeeper.so $@/lib/hw/gatekeeper.default.so
	@ln -sf libSoftGatekeeper.so $@/lib64/hw/gatekeeper.default.so

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINKS)

TRUSTKERNEL_SYMLINKS := $(TARGET_OUT_VENDOR)
$(TRUSTKERNEL_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating trustkernel symlinks: $@"
	@mkdir -p $@/lib/hw
	@mkdir -p $@/lib64/hw
	@ln -sf libSoftGatekeeper.so $@/lib/hw/gatekeeper.default.so
	@ln -sf gatekeeper.trustkernel.so $@/lib/hw/gatekeeper.mt6771.so
	@ln -sf gatekeeper.trustkernel.so $@/lib/hw/gatekeeper.v7101o.so
	@ln -sf keystore.v2.trustkernel.so $@/lib/hw/keystore.mt6771.so
	@ln -sf keystore.v2.trustkernel.so $@/lib/hw/keystore.v7101o.so
	@ln -sf kmsetkey.trustkernel.so $@/lib/hw/kmsetkey.mt6771.so
	@ln -sf kmsetkey.trustkernel.so $@/lib/hw/kmsetkey.v7101o.so
	@ln -sf libSoftGatekeeper.so $@/lib64/hw/gatekeeper.default.so
	@ln -sf gatekeeper.trustkernel.so $@/lib64/hw/gatekeeper.mt6771.so
	@ln -sf gatekeeper.trustkernel.so $@/lib64/hw/gatekeeper.v7101o.so
	@ln -sf keystore.v2.trustkernel.so $@/lib64/hw/keystore.mt6771.so
	@ln -sf keystore.v2.trustkernel.so $@/lib64/hw/keystore.v7101o.so
	@ln -sf kmsetkey.trustkernel.so $@/lib64/hw/kmsetkey.mt6771.so
	@ln -sf kmsetkey.trustkernel.so $@/lib64/hw/kmsetkey.v7101o.so

ALL_DEFAULT_INSTALLED_MODULES += $(TRUSTKERNEL_SYMLINKS)

endif
