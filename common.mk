#
# This is the product configuration for a full common
#
include $(all-subdir-makefiles)

COMMON_FOLDER := device/generic/safestrap-common

# Packages
PRODUCT_PACKAGES += \
    safestrapmenu \
    libpng \
    fb2png.bin \
    updater

# Setup 2nd-init.zip
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/sbin/2nd-init:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/2nd-init \
    $(COMMON_FOLDER)/sbin/getprop:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/getprop \
    $(COMMON_FOLDER)/sbin/hijack.killall:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/hijack.killall \
    $(COMMON_FOLDER)/sbin/stop:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/stop \
    $(COMMON_FOLDER)/sbin/taskset:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/taskset \

# Setup install-files

# Common files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/version:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/flags/version \
    $(COMMON_FOLDER)/recovery_mode:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/flags/recovery_mode \
    $(COMMON_FOLDER)/sbin/bbx:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/bbx \

# Recovery files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/sbin/update-binary:$(TARGET_RECOVERY_OUT)/root/sbin/update-binary

# Add battd
ifdef BOARD_IS_MOTOROLA_DEVICE
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/sbin/battd:$(TARGET_RECOVERY_OUT)/root/sbin/battd \
    $(COMMON_FOLDER)/sbin/bbx:$(TARGET_RECOVERY_OUT)/root/sbin/bbx \
    $(COMMON_FOLDER)/sbin/libhardware_legacy.so:$(TARGET_RECOVERY_OUT)/root/sbin/libhardware_legacy.so \
    $(COMMON_FOLDER)/sbin/libnetutils.so:$(TARGET_RECOVERY_OUT)/root/sbin/libnetutils.so \
    $(COMMON_FOLDER)/sbin/libwpa_client.so:$(TARGET_RECOVERY_OUT)/root/sbin/libwpa_client.so
endif

# App files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/busybox:$(TARGET_RECOVERY_OUT)/root/../APP/busybox \

PRODUCT_NAME := full_safestrap
PRODUCT_DEVICE := safestrap
PRODUCT_BRAND := generic
PRODUCT_MODEL := generic

