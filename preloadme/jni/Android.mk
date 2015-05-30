LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := zzpreloadme # should match the name in the AndroidManifest.xml
LOCAL_SRC_FILES := main.c
LOCAL_LDLIBS    := -L$(LOCAL_PATH) -llog -ldl

include $(BUILD_SHARED_LIBRARY)
