PRODUCT_BRAND ?= viper

SUPERUSER_EMBEDDED := true

PRODUCT_BOOTANIMATION := vendor/viper/prebuilt/common/bootanimation/bootanimation.zip

# PixelLauncher
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/apk/PixelLauncher/PixelLauncher.apk:system/priv-app/PixelLauncher/PixelLauncher.apk
	
# GoogleWallpaperPicker
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/apk/GoogleWallpaperPicker/GoogleWallpaperPicker.apk:system/app/GoogleWallpaperPicker/GoogleWallpaperPicker.apk

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/viper/overlay/dictionaries
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

#SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Enable Google Assistant on all devices.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opa.eligible_device=true

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/viper/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/viper/prebuilt/common/bin/50-viper.sh:system/addon.d/50-viper.sh \
    vendor/viper/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/viper/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/viper/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/viper/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/viper/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/viper/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/viper/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# viper-specific init file
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/etc/init.local.rc:root/init.viper.rc \

# Installer
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/viper/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/viper/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/viper/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

PRODUCT_COPY_FILES += \
    vendor/viper/configs/permissions/com.viper.android.xml:system/etc/permissions/com.viper.android.xml

# Include CM audio files
include vendor/viper/configs/cm_audio.mk

# Theme engine
include vendor/viper/configs/themes_common.mk

ifneq ($(TARGET_DISABLE_CMSDK), true)
# CMSDK
include vendor/viper/configs/cmsdk_common.mk
endif

# Required viper packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    Development \
    LatinIME \
    LatinImeDictionaryPack \
    Microbes \
    Stk \
    ThemeInterfacer

# Optional viper packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom CM packages
PRODUCT_PACKAGES += \
    AudioFX \
    CMAudioService \
    CMParts \
    CMSettingsProvider \
    CustomTiles \
    Eleven \
    ExactCalculator \
    LiveLockScreenService \
    LockClock \
    WallpaperPicker \
    WeatherManagerService \
    WeatherProvider

# Custom Omni packages
PRODUCT_PACKAGES += \
    OmniJaws \
    OmniStyle
	
# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in CM
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    nano \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

#DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3

# OMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.substratum.verified=true

# Common overlay
DEVICE_PACKAGE_OVERLAYS += vendor/viper/overlay/common

PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE = 0

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

VIPER_BUILD_DATE := $(shell LC_ALL=C date +%Y-%m-%d)
VIPER_BRANCH=7.1.1

# Increase Viper Version with each major release.
VIPER_BUILD_VERSION := 1.0

ifneq ($(VIPER_BUILD),)
    # VIPER_BUILD=<goo version int>/<build string>
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=viper \
        ro.goo.rom=viper \
        ro.goo.version=$(shell echo $(VIPER_BUILD) | cut -d/ -f1)

    VIPER_VERSION=$(TARGET_PRODUCT)_$(VIPER_BRANCH)_$(shell echo $(VIPER_BUILD) | cut -d/ -f2)
else
    ifeq ($(VIPER_BUILDTYPE),)
        # VIPER_BUILDTYPE not defined
	VIPER_BUILDTYPE := Naja
    endif

    VIPER_VERSION=$(TARGET_PRODUCT)_$(VIPER_BRANCH)_$(VIPER_BUILDTYPE)_$(VIPER_BUILD_VERSION)_$(VIPER_BUILD_DATE)
endif

VIPER_DISPLAY_VERSION := $(VIPER_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.viper.version=$(VIPER_VERSION) \
    ro.viper.branch=$(VIPER_BRANCH) \
    ro.viper.device=$(VIPER_DEVICE) \
    ro.viper.releasetype=$(VIPER_BUILDTYPE) \
    ro.modversion=$(VIPER_VERSION) \
    ro.viper.display.version=$(VIPER_DISPLAY_VERSION)

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/viper/build/target/product/security/viper-releasekey

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/viper/configs/partner_gms.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
