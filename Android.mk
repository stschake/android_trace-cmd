LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/include/traceevent \
	$(LOCAL_PATH)/include/trace-cmd \
	$(LOCAL_PATH)/lib/traceevent/include \
	$(LOCAL_PATH)/lib/trace-cmd/include \
	$(LOCAL_PATH)/tracecmd/include
LOCAL_SRC_FILES := \
	lib/traceevent/event-parse.c \
	lib/traceevent/event-plugin.c \
	lib/traceevent/kbuffer-parse.c \
	lib/traceevent/parse-filter.c \
	lib/traceevent/str_error_r.c \
	lib/traceevent/trace-seq.c \
	lib/traceevent/parse-utils.c

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/lib/traceevent/include

LOCAL_MODULE := libtraceevent
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/include/traceevent \
	$(LOCAL_PATH)/include/trace-cmd \
	$(LOCAL_PATH)/lib/traceevent/include \
	$(LOCAL_PATH)/lib/trace-cmd/include \
	$(LOCAL_PATH)/tracecmd/include
LOCAL_SRC_FILES := \
	lib/trace-cmd/trace-blk-hack.c \
	lib/trace-cmd/trace-hash.c \
	lib/trace-cmd/trace-input.c \
	lib/trace-cmd/trace-util.c \
	lib/trace-cmd/trace-ftrace.c \
	lib/trace-cmd/trace-hooks.c \
	lib/trace-cmd/trace-recorder.c \
	android/glob.c
LOCAL_SHARED_LIBRARIES := libtraceevent
LOCAL_EXPORT_C_INCLUDES := \
	$(LOCAL_PATH)/lib/trace-cmd/include \
	$(LOCAL_PATH)/android

LOCAL_MODULE := libtrace-cmd
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := trace-cmd
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -DNO_AUDIT
LOCAL_SRC_FILES := \
    tracecmd/trace-check-events.c \
	tracecmd/trace-cmd.c \
	tracecmd/trace-hist.c \
	tracecmd/trace-list.c \
	tracecmd/trace-listen.c \
	tracecmd/trace-mem.c \
	tracecmd/trace-msg.c \
	tracecmd/trace-output.c \
	tracecmd/trace-profile.c \
	tracecmd/trace-read.c \
	tracecmd/trace-record.c \
	tracecmd/trace-restore.c \
	tracecmd/trace-show.c \
	tracecmd/trace-snapshot.c \
	tracecmd/trace-split.c \
	tracecmd/trace-stack.c \
	tracecmd/trace-stat.c \
	tracecmd/trace-stream.c \
	tracecmd/trace-usage.c
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/include/trace-cmd \
	$(LOCAL_PATH)/include/traceevent \
	$(LOCAL_PATH)/tracecmd/include \
	$(LOCAL_PATH)/lib/traceevent/include \
	$(LOCAL_PATH)/lib/trace-cmd/include \
	$(LOCAL_PATH)/android
LOCAL_SHARED_LIBRARIES := \
	libcutils \
	liblog \
	libutils \
	libtraceevent \
	libtrace-cmd
include $(BUILD_EXECUTABLE)