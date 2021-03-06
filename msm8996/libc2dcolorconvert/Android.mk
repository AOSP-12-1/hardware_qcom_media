LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        C2DColorConverter.cpp

LOCAL_CFLAGS += -Wno-error

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/qcom/display

ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif

LOCAL_SHARED_LIBRARIES := liblog libdl
LOCAL_HEADER_LIBRARIES := copybit_headers gralloc_headers

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libc2dcolorconvert
LOCAL_LICENSE_KINDS := SPDX-license-identifier-BSD
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/../NOTICE

ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif

LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
