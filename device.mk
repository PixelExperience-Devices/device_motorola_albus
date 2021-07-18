# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2020 The PixelExperience Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Vendor blobs
$(call inherit-product-if-exists, vendor/motorola/albus/albus-vendor.mk)

# Device Path
DEVICE_PATH := device/motorola/albus

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_CONFIG := normal

# Audio
PREBUILT_AUDIOHAL := true

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/camera/mot_imx362_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_imx362_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_ov5695_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov5695_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_ov5695_ofilm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov5695_ofilm_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_s5k2l7_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_s5k2l7_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_s5k2l7sa_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_s5k2l7sa_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/msm8953_mot_albus_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8953_mot_albus_camera.xml

PRODUCT_PACKAGES += \
    CameraGo \
    libbson.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.sys.albus.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.sys.albus.rc

# ModService
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/whitelist_modservice.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/whitelist_modservice.xml

# Motorola Health
PRODUCT_PACKAGES += \
    motorola.hardware.health@1.0.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service \
    com.android.nfc_extras \
    SecureElement \
    NfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.albus.rc \
    init.gbmods.sh \
    init.mmi.laser.sh
# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Shim
PRODUCT_PACKAGES += \
    libshim_camera

# Inherit from motorola msm8953-common
$(call inherit-product, device/motorola/msm8953-common/msm8953.mk)
