# Inherit common VIPER stuff
$(call inherit-product, vendor/viper/configs/common.mk)

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

PRODUCT_SIZE := full

# Include VIPER LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/viper/overlay/dictionaries

PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

# Recorder
PRODUCT_PACKAGES += \
    Recorder

# SwagPapers
PRODUCT_PACKAGES += \
    SwagPapers
