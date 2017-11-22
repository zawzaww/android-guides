<img src="https://img.xda-cdn.com/XXEijIJ9sFe_-u4VZQgkjZkKwcU=/http%3A%2F%2Fwww.aftvnews.com%2Fwp-content%2Fuploads%2F2016%2F02%2Fteamwin-recovery-project-twrp-logo.jpg" height="100%" width="100%;" />

# How To Build a CustomRecovery (TWRP) for Android Devices

# Team Win Recovery Project (TWRP)

## Introduction
   ဒီတခါ ကြၽန္ေတာ္ေရးမယ့္ အေၾကာင္းအရာကေတာ့ SourceCode ကေန Android Devices ေတြအတြက္ Custom Recovery တခု Build နည္းကုိ ေျပာျပေပးမွာျဖစ္ပါတယ္။ ဒီေနရာမွာ ႐ွင္းျပစရာေတြ႐ွိပါတယ္ Android မွာ Recovery ပုိင္းမွာ ႏွစ္မ်ဳိး႐ွိပါယ္။ Stock Recovery နဲ႔ Custom Recovery ဆုိၿပီး ႐ွိပါတယ္။ 
Stock Recovery က ဖုန္းဝယ္ကတည္းက built-in ပါလာတဲ့ Recovery တခုျဖစ္ပါတယ္၊ ပုံမွန္အားျဖင့္ ဘာေတြလုပ္လုိ႔ရလည္းဆုိေတာ့ အဲဒီ Stock Recovery Mode ကေန ဖုန္းရဲ႕ Data ေတြကုိ Factory Reset ခ်ႏုိင္တယ္၊ Wipe cache နဲ႔ Wipe davilk cache လုပ္ႏုိင္မယ္၊ Firmware Official Update Zip ေတြနဲ႔ Update လုပ္ႏုိင္တယ္။ (ဥပမာ OnePlus ဖုန္းေတြ သုံးဖူးရင္ သိပါတယ္ အဲဒီ Stock Recovery ကေန Firmware Update ေတြ လုပ္သြားလု႔ိရပါတယ္ )။
Custom Recovery ဆုိတဲ့ ေခါင္းစဥ္ေအာက္မွာ ထပ္ခြဲလုိ႔ ရပါေသးတယ္။ CWM Recovery / PhilZ Touch Recovery / TWRP Revovery ဆုိၿပီး ႐ွိပါတယ္၊ PhilZ Touch က တကယ္က CWM Advanced Edition တခုပါပဲ။ ကြၽန္ေတာ္ အဓိကေျပာမွာ Features အၾကမ္းေတြနဲ႔ လူအမ်ားသိတဲ့ TWRP (Team Win Recovery Project) အေၾကာင္းပါပဲ။ TWRP ရဲ႕ ပုံမွန္ features ေတြက FlashableZip ေတြ Install လုပ္ႏုိင္မယ္ အဲဒီထဲမွာ Custom ROM ေတြ Kernel ေတြ Install လုပ္တာေတြ Root လုပ္တဲ့အပုိင္းေတြ အကုန္ပါပါတယ္၊ /data  /boot  /system  /recovery partition ေတြ အကုန္ Backup and Restore လုပ္ႏုိင္မယ္(တနည္းအားျဖင့္ Firmware ႀကီးတခုလုံး  Backup/Restore လုပ္ႏုိင္မယ္)၊ /data  /cache  /system ေတြ Wipe လု႔ိရမယ္ အဲဒီအထဲ Factory Reset ခ်တာေတြ Format Data လုပ္တာေတြ အကုန္ပါပါတယ္ ၊ ေနာက္ mount/unmount လုပ္ခြင့္႐ွိမယ္၊ TWRP Recovery Mode ရဲ႔ file manager ကေန /system ထဲ access (read/write) လုပ္ခြင့္႐ွိမယ္၊ ေနာက္ထပ္ features ေတြ အမ်ားႀကီး ႐ွိပါေသးတယ္ မေျပာေတာ့ပါဘူး ဒီေလာက္ဆုိ လုံေလာက္မယ္ ထင္ပါတယ္။
ဗဟုသုတ တခုအေနနဲ႔ သိေအာင္ေျပာျပပါမယ္ TWRP(TeamWin Recovery Project) ရဲ႕ Lead Developer/Founder က DeesTroy လု႔ိေခၚပါတယ္၊ [Dees_Troy's XDA Profile](https://forum.xda-developers.com/member.php?u=912474) ပါ စိတ္္္္ဝင္စားရင္ ဝင္ဖက္ၾကည့္ႏုိင္ပါတယ္။


## Requirements
- Linux Computer
- Git and Repo( Google's git-repo )
- Good Internet Connection
- Linux Commands

## Sources
- အရင္ဆုံး SourceCode ကေန Compilation မလုပ္ခင္ လုိအပ္တဲ့ Sources ေတြ ႐ွိတဲ့ေနရာကုိေျပာျပပါမယ္။
- TWRP Recovery တခု Build ဖုိ႔ SourceCode ယူရမယ့္ ေနရာက ႏွစ္ခု႐ွိပါတယ္၊ ပထမတခုက OmniROM Sourceျဖစ္ႃပီး၊ ဒုတိယ တခုက LineageOS Source ႃဖစ္ပါတယ္၊ ကြၽန္ေတာ္အၾကံေပးခ်င္တာကေတာ့ OmniROM SourceCode ကေန Build ပါလု႔ိႂကံေပးခ်င္ပါတယ္၊ ကြၽန္ေတာ္ကုိယ္တုိင္လည္း OmniROM Source ပဲ သုံးပါတယ္၊ TWRP ရဲ႕ Core Recovery files ေတြက "omnirom/android_bootable_recovery" ဆုိတဲ့ Repository ေအာက္မွာ႐ွိပါတယ္၊ Omni Source က ပုိၿပီး Stable ႃဖစ္ပါလိမ့္မယ္။
- ေနာက္ထပ္ၿပီး အၾကံေပးခ်င္တာကေတာ့ OmniROM Full SourceCode ဆုိ Internet Connection မေကာင္းရင္ အဆင္မေျပပါဘူး filesize က အရမ္းမ်ားပါတယ္၊ ဒါေၾကာင့္ TWRP Build ဖုိ႔ သပ္သပ္လုပ္ထားတဲ့ OmniROM Minimal Manifest Sources ပဲ အသုံးျပဳပါလုိ႔ အၾကံေပးပါတယ္။
- Minimal OmniROM SourceCode...(for only TWRP Building)
https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni
- ေနာက္တခု လုိအပ္တာေတြကေတာ့ ကုိယ့္ Android ဖုန္းရဲ႕ Device tree နဲ႔ Kernel source ပါပဲ။ ( ကြၽန္ေတာ္ကေတာ့ ထုံစံအတုိင္း Nexus 5X နဲ႔ Nexus 6 နဲ႔ နမူနာေပးၿပီး ေရးေပးသြားမွာပါ )
- Setup Environment လုပ္တဲ့ အပုိင္းကေတာ့ AOSP ROM Building Tutorial မွာ ေရးထားႃပီးသားျဖစ္လု႔ိ ထပ္ၿပီး မေျပာေတာ့ပါဘူး၊ ပထမ Tutorial ကုိ အရင္ေလ့လာၿပီးမွ အဆင္ေျပပါလိမ့္မယ္။ ( Installation Python, Git, git-repo and buildtools )

## Downloading the Sources
- Sources ေတြ download မလုပ္ခင္ အေပၚမွာေျပာခဲ့တဲ့အတုိင္း Computer မွာ Setup Environment လုပ္တဲ့အပုိင္းကုိ ပထမ AOSP ROM Building Tutorial မွာ အရင္ဖက္ၾကည့္ပါ၊ အဲဒါေတြ ရသြားမွ Downloading လုပ္တဲ့ အပုိင္းက အဆင္ေျပပါလိမ့္မယ္။
- ပထမဆုံး Dir တခု ေဆာက္ႃပီး SourceCode Repos ေတြ ကုိယ့္ရဲ႕ Local Computer ထဲကုိ Downloading လုပ္သြားမွာပါ။
- Dir တခု ေဆာက္ပါမယ္။
```bash
mkdir TWRP-Recovery-Project
```
```bash
cd TWRP-Recovery-Project
```
- ႃပီးတဲ့ေနာက္ Local Repository မွာ Sources ေတြ Download ဖုိ႔ Initialize လုပ္ေပးဖုိ႔ လုိပါတယ္။ ( ဒီေနရာမွာ တခုေျပာျပခ်င္ပါတယ္ ကုိယ့္ေအာက္ဆုံးထား Build ခ်င္တဲ့ Android version (branch name) ကုိ သိရပါမယ္ ကြၽန္ေတာ္ကေတာ့ 6.0 branch ပဲသုံးပါတယ္ )
```bash
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0
```
(OR)
- ေနာက္ထပ္ အၾကံေပးခ်င္တာကေတာ့ Internet အဆင္မေျပလု႔ိ Sources ေတြ filesize သက္သက္သာသာန႔ဲ download လုပ္ခ်င္ရင္ ေအာက္က command ေလး သုံးႏုိင္ပါတယ္။ ( minimal sources ေတြက size အရမ္းမမ်ားပါဘူး 5GB ကေန 8GB ၾကားေလာက္ပဲ ႐ွိပါတယ္ )
```bash
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0
```
- Download လုပ္ဖုိ႔အတြက္ ဒီ command ေလးဆက္႐ုိက္ေပးပါ။
```bash
repo sync
```
- Downloading အပုိင္းက ကုိယ့္ရဲ႕ Internet connection ေပၚမွာ မူတည္ၿပီး ၾကာပါလိမ့္မယ္။
- ဒါေတြ ႃပီးသြားရင္ေတာ့ TWRP Recovery တခု Build ဖု႔ိ အဆင္သင့္ ႃဖစ္ပါၿပီ။

## How To Build
- အရင္ဆုံး SourceCode ကေန TWRP Recovery Compilation မလုပ္ခင္ Device tree ထဲမွာ ႃပင္ဆင္စရာေတြ႐ွိပါတယ္၊ TWRP flags ေတြ ထည့္ေပးဖု႔ိလုိအပ္ပါတယ္။ ( ကြၽန္ေတာ္ အဆင္သင့္ေရးေပးထားပါတယ္ ဒီ Repo ထဲမွာ အသုံးဝင္တဲ့ TWRP flags ေတြကုိ https://github.com/zawzaww/android-building-tutorials/blob/tutorials/Useful-TWRP-flags.mk Programming နဲ႔ မစိမ္းတဲ့သူတေယာက္ဆုိ နားလည္ပါလိမ့္မယ္ ဖက္ၾကည့္ေပးပါ Code ေတြ အေပၚမွာ ဘယ္အတြက္သုံးတယ္ဆုိတာ အသုံးဝင္ပုံကုိ comment line ေတြနဲ႔ တခါတည္း နားလည္ေအာင္ ေရးေပးထားပါတယ္၊ အခု Tutorial မွာ ကြၽန္ေတာ္ လက္႐ွိသုံးေနတဲ့ Nexus 6 နဲ႔ ပဲ ဥပမာေပးေျပာသြားမွာပါ )
- ပထမဆုံး ကုိယ္ Build မယ့္ Android Device ရဲ႕ Device tree နဲ႔ Kernel source လုိပါတယ္၊ Device tree နဲ႔ Kernel Source သြားထည့္ေပးရမယ့္ Location ကေတာ့ ROM Building Tutorial ထဲကတုိင္း တူတူပါပဲ၊ ထပ္ေျပာေပးပါမယ္

- Device Tree
- Format:
```bash
device/manufacturer/device_name
```
- Example: for Nexus 6
```bash
device/moto/shamu
```

- Kernel Source
- Format: 
```bash
kernel/manufacturer/device_name (or) chipset_name for any android devices
```
- Example: for Nexus 6
```bash
kernel/moto/shamu
```
- Vendor ( need for any android devices )
- Format:
```bash
vendor/manufacturer/device_name
```
- Example: for Nexus 6
```bash
vendor/motorola/shamu
```
- အရင္ဆုံး TWRP flags ေတြန႔ဲ ရင္းႏွီးသြားေအာင္ ဒီမွာ သြားေလ့လာၾကည့္ပါ https://github.com/zawzaww/android-building-tutorials/blob/tutorials/Useful-TWRP-flags.mk
- ႃပီးသြားရင္ Device tree folder ထဲဝင္လုိက္ပါ၊ အဲဒီထဲက BoardConfig.mk မွာ မျဖစ္ေနထည့္သြင္းရမယ့္ TWRP flags ေတြ ေအာက္မွာ ဆက္ေျပာေပးပါမယ္။
- Example: device/moto/shamu/BoardConfig.mk (or) BoardConfigOmni.mk ကုိ TextEditor တခုခုနဲ႔ ဖြင့္လုိက္ႃပီး ေအာက္က လုိအပ္တဲ့ TWRP flags ေတြ add ေပးပါ။

TWRP Theme: for TWRP UI Theme
```bash
TW_THEME := portrait_hdpi
```

This enables proper handling of /data/media on devices that have this folder for storage
```bash
RECOVERY_SDCARD_ON_DATA := true
```

Disables things like sdcard partition (If you do not define this flag and also do not include any references to /sdcard, /internal_sd, /internal_sdcard, or /emmc in your fstab)
```bash
BOARD_HAS_NO_REAL_SDCARD := true
```

TWRP Inline Kernel (Need this flags If you want to build from kernel source.This is my PureZ Kernel for Nexus 6)
```bash
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/moto/shamu
TARGET_KERNEL_CONFIG := purez_defconfig
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
```

Disables the display of the battery percentage for devices on TWRP
```bash
TW_NO_BATT_PERCENT := true
```

Disables the display of the CPU Temperature for devices on TWRP
```bash
TW_NO_CPU_TEMP := true
```

CPU Architecture (This is depend on your Device's cpu architecture)

Example: for Nexus 6 (ARM device)
```bash
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
```

Bootloader and Board Platform

Example: for Nexus 6
```bash
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8084
TARGET_BOOTLOADER_BOARD_NAME := shamu
TARGET_NO_RPC := true
TARGET_BOARD_INFO_FILE := device/moto/shamu/board-info.txt
```

F2FS filesystem Support for TWRP  (Make sure your kernel supports f2fs)
```bash
TARGET_USERIMAGES_USE_F2FS := true
```

fstab.shamu : Example for Nexus 6
```bash
# Android fstab file.
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK
#
#<src>                                             <mnt_point>     <type>  <mnt_flags and options>                                         <fs_mgr_flags>
/dev/block/platform/msm_sdcc.1/by-name/system       /system         ext4    ro,barrier=1                                wait
/dev/block/platform/msm_sdcc.1/by-name/userdata     /data           ext4    rw,nosuid,nodev,noatime,nodiratime,noauto_da_alloc,nobarrier    wait,check,formattable,encryptable=/dev/block/platform/msm_sdcc.1/by-name/metadata
/dev/block/platform/msm_sdcc.1/by-name/userdata     /data           f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr,nobarrier       wait,formattable,encryptable=/dev/block/platform/msm_sdcc.1/by-name/metadata
/dev/block/platform/msm_sdcc.1/by-name/cache        /cache          ext4    rw,noatime,nosuid,nodev,barrier=1,data=ordered   wait,check,formattable
/dev/block/platform/msm_sdcc.1/by-name/cache        /cache          f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr,nobarrier       wait,check,formattable
/dev/block/platform/msm_sdcc.1/by-name/modem        /firmware       ext4    ro,barrier=1,context=u:object_r:firmware_file:s0    wait
/dev/block/platform/msm_sdcc.1/by-name/persist      /persist        ext4    rw,nosuid,nodev,barrier=1                      wait,check,notrim
/dev/block/platform/msm_sdcc.1/by-name/boot         /boot           emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/recovery     /recovery       emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/misc         /misc           emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/modem        /modem          emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs1  /mdm1m9kefs1    emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs2  /mdm1m9kefs2    emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs3  /mdm1m9kefs3    emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/sbl1         /sbl1           emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/tz           /tz             emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/rpm          /rpm            emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/sdi          /sdi            emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/aboot        /aboot          emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/versions     /versions       emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/logo         /logo           emmc    defaults                                                        defaults
/dev/block/platform/msm_sdcc.1/by-name/frp          /persistent     emmc    defaults                                                        defaults
/devices/*/xhci-hcd.0.auto/usb* auto auto defaults 
```

Recovery fstab for Nexus 6
```bash
TARGET_RECOVERY_FSTAB = device/moto/shamu/fstab.shamu
```

Your Device's screen will stay awake on TWRP
```bash
TW_NO_SCREEN_TIMEOUT := true
```

Add support for encryption data on TWRP
```bash
TW_INCLUDE_CRYPTO := true
```

Disable/enable SELinux (Only suggested when you want to enable SELinux support)
```bash
TWHAVE_SELINUX := true
```

Max Screen brightness for TWRP
```bash
TW_MAX_BRIGHTNESS := 255
```

Default Screen Brightness for TWRP
```bash
TW_DEFAULT_BRIGHTNESS := 112
```

Needed on devices without a recovery partition (some devices have recovery included in boot.img)
```bash
TW_HAS_NO_RECOVERY_PARTITION := true
```

recovery.fstab (OR) twrp.fstab

TWRP Configuration for Nexus 6

Example: for Nexus 6
```bash
/system      ext4    /dev/block/platform/msm_sdcc.1/by-name/system
/data        ext4    /dev/block/platform/msm_sdcc.1/by-name/userdata      flags=encryptable=/dev/block/platform/msm_sdcc.1/by-name/metadata
/cache       ext4    /dev/block/platform/msm_sdcc.1/by-name/cache
/firmware    ext4    /dev/block/platform/msm_sdcc.1/by-name/modem         flags=mounttodecrypt
/boot        emmc    /dev/block/platform/msm_sdcc.1/by-name/boot
/recovery    emmc    /dev/block/platform/msm_sdcc.1/by-name/recovery      flags=backup=1
#/misc        emmc    /dev/block/platform/msm_sdcc.1/by-name/misc
/modem       emmc    /dev/block/platform/msm_sdcc.1/by-name/modem
/mdm1m9kefs1 emmc    /dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs1   flags=backup=1;display=EFS
/mdm1m9kefs2 emmc    /dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs2   flags=backup=1;subpartitionof=/mdm1m9kefs1
/mdm1m9kefs3 emmc    /dev/block/platform/msm_sdcc.1/by-name/mdm1m9kefs3   flags=backup=1;subpartitionof=/mdm1m9kefs1
/sbl1        emmc    /dev/block/platform/msm_sdcc.1/by-name/sbl1
/tz          emmc    /dev/block/platform/msm_sdcc.1/by-name/tz
/rpm         emmc    /dev/block/platform/msm_sdcc.1/by-name/rpm
/sdi         emmc    /dev/block/platform/msm_sdcc.1/by-name/sdi
/aboot       emmc    /dev/block/platform/msm_sdcc.1/by-name/aboot
/versions    emmc    /dev/block/platform/msm_sdcc.1/by-name/versions
/logo        emmc    /dev/block/platform/msm_sdcc.1/by-name/logo
/usb-otg vfat /dev/block/sda1 /dev/block/sda flags=removable;storage;display=USB-OTG
```

And, you need add this line on your device.mk (for twrp.fstab)
```bash
PRODUCT_COPY_FILES += device/moto/shamu/twrp.fstab:recovery/root/etc/twrp.fstab
```

If you want to write 'TWRP device version' or 'Author name' on TWRP (Ex: 3.1.1-shamu by ZawZaw )

```bash
TW_DEVICE_VERSION := shamu by ZawZaw
```
If you want to full Nexus 6 Device tree...https://github.com/zawzaww/twrp-device-shamu
