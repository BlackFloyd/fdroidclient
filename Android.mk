LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := Privileged-Extension
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := Privileged-Extension

fdroidp_root  := $(LOCAL_PATH)
fdroidp_dir   := Privileged-Extension
fdroidp_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
fdroidp_build := $(fdroidp_root)/$(fdroidp_dir)/build
fdroidp_apk   := build/outputs/apk/$(fdroidp_dir)-release-unsigned.apk

$(fdroidp_root)/$(fdroidp_dir)/$(fdroidp_apk):
	rm -Rf $(fdroidp_build)
	mkdir -p $(fdroidp_out)
	ln -sf $(fdroidp_out) $(fdroidp_build)
	cd $(fdroidp_root)/$(fdroidp_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(fdroidp_dir)/$(fdroidp_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := true

include $(BUILD_PREBUILT)
