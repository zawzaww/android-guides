#################################################################################
#                                                                               #
# Copyright (C) 2017-2018, Zaw Zaw                                              #
#                                                                               #
# GNU GENERAL PUBLIC LICENSE                                                    #    
# Version 3, 29 June 2007                                                       #
#                                                                               #
# This file is free software and you can redistribute it and/or modify          #
# it under the terms of the GNU General Public License as published by          #
# the Free Software Foundation, either version 3 of the License or any version. #
#                                                                               #
# You should have received a copy of the GPL License along with this program.   # 
# If not, see <http://www.gnu.org/licenses/>                                    #
#                                                                               #
#################################################################################

# Useful TWRP Recovery Flags by ZawZaw @XDA-Developers
# Thank to: xda-developers for helps

# You need TWRP recovery flags for building TWRP for your Android Devices.
# Add EXT4 support
TARGET_USERIMAGES_USE_EXT4 := true

# Disable/enable SELinux. Only suggested when you want to enable SELinux support
TWHAVE_SELINUX := true

# Remove MTP support
TW_EXCLUDE_MTP := true

# No screen timeout
TW_NO_SCREEN_TIMEOUT := true

# disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
BOARD_HAS_NO_REAL_SDCARD := true

# this enables proper handling of /data/media on devices that have this folder for storage (most Honeycomb and devices that originally shipped with ICS like Galaxy Nexus
RECOVERY_SDCARD_ON_DATA := true

# HTC Dumlock for those devices which need it
TW_INCLUDE_DUMLOCK := true

# If your device has recovery as a second ramdisk of boot.img
TW_HAS_NO_RECOVERY_PARTITION := true

# To prevent /boot partition not found error
TW_HAS_NO_BOOT_PARTITION := true

# Removes the 'Reboot bootloader' button
TW_NO_REBOOT_BOOTLOADER := true

# Removes the 'Reboot recovery' button
TW_NO_REBOOT_RECOVERY := true

# Disable the battery percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := true

# Same as above, for CPU Temperature
TW_NO_CPU_TEMP := true

# Allows you to map a custom keycode for power button, takes in a number, usually three digits
TW_CUSTOM_POWER_BUTTON := 107

# Always use rm -rf to wipe
TW_ALWAYS_RMRF := true

# Prevent TWRP from unmounting /system
TW_NEVER_UNMOUNT_SYSTEM := true

# Removes USB Storage capability
TW_NO_USB_STORAGE := true

# Automatically implies these:
BOARD_HAS_NO_REAL_SDCARD := true
TW_USE_TOOLBOX := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_MTP := true
TW_OEM_BUILD := true

# Inject TWRP as a second ramdisk for Samsung devices, which keep recoveries that way.
TW_INCLUDE_INJECTTWRP := true

# Specify a path to the lun file on device
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"

# Forces use of /proc/cpuinfo for determining device id. Look here : https://github.com/omnirom/android_b....cpp#l183-l184
TW_FORCE_CPUINFO_FOR_DEVICE_ID := true

# For older devices. See here :https://github.com/omnirom/android_b...ndroid.mk#l383
TW_NO_EXFAT_FUSE := true

# Decryption support for /data
TW_INCLUDE_CRYPTO := true

# On some device, TWRP backup folder name will show 0000000000 bcos cpuinfo has no serial number. Using this flag then it will use ro.product.model as the folder name instead of all 0000000000
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Set the path to the sysfs entry which controls the brightness
TW_BRIGHTNESS_PATH := /sys/devices/platform/s3c24xx-pwm.0/pwm-backlight.0/backlight/pwm-backlight.0/backlight

# A seconday path for the above
TW_SECONDARY_BRIGHTNESS_PATH := your phone's brightness path

# Max brightness to prevent display damage
TW_MAX_BRIGHTNESS := 255

# Default brightness for TWRP
TW_DEFAULT_BRIGHTNESS := 150

# Custom battery readout path, don't use the given path though, it is intended to be used for a full diagnostic.
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery/batt_attr_text

# CPU temp sysfs path, if it is zero all the time.
TW_CUSTOM_CPU_TEMP_PATH := true

# Remove the ability to encrypt backups with a password
TW_EXCLUDE_ENCRYPTED_BACKUPS := true

# Supply a custom init.rc for the recovery
TARGET_RECOVERY_INITRC := device/htc/pico/ramdisk/recovery/init.recovery.rc

# Set the default language, if not english
TW_DEFAULT_LANGUAGE := en-US

# Specify architecture
# For arm
TARGET_ARCH := arm
# For arm64 
TARGET_ARCH := arm64

# For people who would want to have ToyBox rather than Busybox
TW_USE_TOOLBOX := true

# Remove exFAT formatting binaries
TW_NO_EXFAT := true

# Remove SuperSU and stop TWRP prompts to install it
TW_EXCLUDE_SUPERSU := true

# An awesome way to take screenshots. Back-end improvement, no noticeable user side changes. Screenshots work without it too
TW_INCLUDE_FB2PNG := true

# include Logcat daemon for help in debugging
TWRP_INCLUDE_LOGCAT := true

# See here : https://github.com/omnirom/android_b...ndroid.mk#L435
TARGET_RECOVERY_DEVICE_MODULES := true

# Include a custom hardwarekeyboard.cpp . Can't see the point though.
TWRP_CUSTOM_KEYBOARD := device/lge/hammerhead/recovery/hardwarekeyboard.cpp

# Log touch input
TWRP_EVENT_LOGGING := true

# Smartwatch optimisation
TW_ROUND_SCREEN := true

# Remove TrueType fonts
TW_DISABLE_TTF:= true

# building of an OEM friendly TWRP. excludes SuperSu, uses Toolbox instead busybox, disables themeing. MORE INFOS TO BE ADDED
TW_OEM_BUILD := true

# exclude mtp from twrp (disable if you are not able to fix it device/kernel side, safes some space)
TW_EXCLUDE_MTP := true

# screen will stay awake
TW_NO_SCREEN_TIMEOUT := true

# needed on devices without a recovery partition (some devices have recovery included im boot.img)
TW_HAS_NO_RECOVERY_PARTITION := true

# removes the reboot option to boot into boooader, needed e.g. on samsung devices which use Download mode instead
TW_NO_REBOOT_BOOTLOADER := true

# add an option in reboot menu to reboot into Download Mode
TW_HAS_DOWNLOAD_MODE := true

# some devices don't have a temp sensor, disable in such case to stop spamming recovery.log
TW_NO_CPU_TEMP := true

# recursive delete by default instead fotmatting (available optional inside recovery settings too)
TW_ALWAYS_RMRF := true

# system won't be unmounted,
TW_NEVER_UNMOUNT_SYSTEM := true

# don't blank screen (available optional inside recovery settings too)
TW_NO_SCREEN_BLANK := true

# deprecated, use TW_INCLUDE_CRYPTO instead
TW_INCLUDE_JB_CRYPTO := true

# add support for encryption
TW_INCLUDE_CRYPTO := true

# use a custom init.rc in recovery, add the path. Example:
TARGET_RECOVERY_INITRC := device/samsung/p3100/rootdir/init.twrp.rc

# ToyBox (disables busybox?)
TW_USE_TOOLBOX := true

# exclude SuperSu e.g. to save some space or for different other reasons (supersu still included bx default?)
TW_EXCLUDE_SUPERSU := true

# F2FS filesystem support (make sure your kernel supports f2fs!)
TARGET_USERIMAGES_USE_F2FS := true

# device resolution - deprecated, use TW_THEME instead
DEVICE_RESOLUTION := set your device's resolution

# define the theme for your device resolution, note: you can also use smaller/bigger themes because the theme get scaled for your deviceresolution anyway):
# TWRP Themes
# 240x240 280x280 320x320
TW_THEME := watch_mdpi
# 320x480 480x800 480x854 540x960
TW_THEME := portrait_mdpi
# 720x1280 800x1280 1080x1920 1200x1920 1440x2560 1600x2560
TW_THEME := portrait_hdpi
# 800x480 1024x600 1024x768
TW_THEME := landscape_mdpi
# 1280x800 1920x1200 2560x1600
TW_THEME := landscape_hdpi
# TWRP Custom Theme
TW_CUSTOM_THEME := /path/to/theme/

# auto copy files placed in device/$VENDOR/$DEVICENAME/recovery/root inside recovery ramdisk (e.g. init.recivery*.rc which get removed from recoveryramdisk by default). 
# example: for Nexus 5X ( set your device tree's location )
TARGET_RECOVERY_DEVICE_DIRS += device/lge/bulhead

# path to a prebuild kernel (can be used if you are unable to compile a kernel yourself, e.g. if no kernel source available)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/zImage

# swap x anf y axis for touch
RECOVERY_TOUCHSCREEN_SWAP_XY := true

# flip x axis for touch
RECOVERY_TOUCHSCREEN_FLIP_X := true

# flip y axis for touch,
RECOVERY_TOUCHSCREEN_FLIP_Y := true
