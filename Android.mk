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
	@ln -sf $@/lib/hw/libSoftGatekeeper.so $@/lib/hw/gatekeeper.default.so
	@ln -sf $@/lib64/hw/libSoftGatekeeper.so $@/lib64/hw/gatekeeper.default.so

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINKS)

endif
