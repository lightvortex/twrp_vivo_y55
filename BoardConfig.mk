#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := pd1613,PD1613

LOCAL_PATH := device/vivo/y55

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=null androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
# Use prebuilt kernel if defined
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := device/vivo/y55/kernel
else
        TARGET_KERNEL_ARCH := arm
        BOARD_KERNEL_IMAGE_NAME := zImage-dtb
        TARGET_KERNEL_APPEND_DTB := true
        TARGET_KERNEL_CONFIG := lineageos_y55_defconfig
        TARGET_KERNEL_SOURCE := kernel/vivo/msm8937
endif

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Display
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
USE_OPENGL_RENDERER := true


# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1024000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11003206656
BOARD_CACHEIMAGE_PARTITION_SIZE := 260046848
TARGET_USERIMAGES_USE_EXT4 := true

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Keymaster
TARGET_PROVIDES_KEYMASTER := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# SDCard
RECOVERY_SDCARD_ON_DATA = true

# Screen
TARGET_RECOVERY_PIXEL_FORMAT        := "RGBX_8888"
TW_SCREEN_BLANK_ON_BOOT             := true

# Interface
TW_THEME                            := portrait_hdpi
TW_INPUT_BLACKLIST                  := "hbtp_vm" # Disable mouse cursor
RECOVERY_GRAPHICS_USE_LINELENGTH    := true
TW_NEW_ION_HEAP                     := true

# Language
TW_EXTRA_LANGUAGES                  := true

# Misc TWRP
BOARD_SUPPRESS_SECURE_ERASE         := true # don't take forever to wipe
BOARD_HAS_NO_SELECT_BUTTON          := true
TW_INCLUDE_FB2PNG                   := true
