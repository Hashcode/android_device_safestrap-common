#
# This is the product configuration for a full common
#
include $(all-subdir-makefiles)

COMMON_FOLDER := device/safestrap-common

PRODUCT_PACKAGES += \
    safestrapmenu \
    libpng \
    fb2png.bin

PRODUCT_NAME := full_safestrap
PRODUCT_DEVICE := safestrap
PRODUCT_BRAND := generic
PRODUCT_MODEL := generic

