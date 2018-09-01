<center>
<img src="https://s20.postimg.cc/jzy9c1dzh/twrp-recovery.jpg" height="100%" width="100%;" />
</center>

# How To Build TWRP Recovery for Android Devices

## Introduction
### Team Win Recovery Project (TWRP)
   ဒီတခါ ကြၽန္ေတာ္ေျပာျပမယ့္ အေၾကာင္းအရာကေတာ့ SourceCode ကေန Android Devices ေတြအတြက္ Custom Recovery တခု Build နည္းကုိ ေျပာျပေပးမွာျဖစ္ပါတယ္။ ဒီေနရာမွာ ႐ွင္းျပစရာေတြ႐ွိပါတယ္ Android မွာ Recovery ပုိင္းမွာ ႏွစ္မ်ဳိး႐ွိပါယ္။ Stock Recovery နဲ႔ Custom Recovery ဆုိၿပီး ႐ွိပါတယ္။ 
Stock Recovery က ပုံမွန္အားျဖင့္ ဖုန္းဝယ္ကတည္းက built-in ပါလာတဲ့ Recovery တခုျဖစ္ပါတယ္ (ခြၽင္းခ်က္ - တခ်ဳိ့ device ေတြမွာေတာ့ ပါမလာတတ္ပါဘူး)၊ ပုံမွန္အားျဖင့္ ဘာေတြလုပ္လုိ႔ရလည္းဆုိေတာ့ အဲဒီ Stock Recovery Mode ကေန ဖုန္းရဲ႕ Data ေတြကုိ Wipe Data/Factory Reset ခ်ႏုိင္မယ္ Wipe Cache လုပ္ႏုိင္မယ္၊ Firmware Official Update Zip ေတြနဲ႔ Update လုပ္ႏုိင္တယ္ (ဥပမာ OnePlus ဖုန္းေတြ သုံးဖူးရင္ သိပါတယ္ သူ႔ရဲ႕ Stock Recovery ကေန Firmware Update ေတြ လုပ္သြားလု႔ိရပါတယ္ ) ၊ Stock ကေတာ့ ဒီေလာက္ပါပဲ features အမ်ားႀကီးေတာ့ မပါပါဘူး။
Custom Recovery ဆုိတဲ့ ေခါင္းစဥ္ေအာက္မွာ ထပ္ခြဲလုိ႔ ရပါေသးတယ္။ CWM(ClockworkMod) Recovery / PhilZ Touch Recovery / TWRP Revovery ဆုိၿပီး ႐ွိပါတယ္၊ PhilZ Touch က တကယ္က CWM Advanced Edition တခုပါပဲ။ ကြၽန္ေတာ္ အဓိကေျပာမွာက Features အၾကမ္းေတြနဲ႔ လူအမ်ားသိတဲ့ TWRP (Team Win Recovery Project) အေၾကာင္းပါပဲ။ TWRP ရဲ႕ ပုံမွန္ features ေတြက FlashableZip ေတြ Install လုပ္ႏုိင္မယ္ အဲဒီထဲမွာ Custom ROM ေတြ Kernel ေတြ Install လုပ္တာေတြ Android Rooting အပုိင္းေတြ အကုန္ပါပါတယ္၊ /data  /boot  /system  /recovery partition ေတြ အကုန္ Backup and Restore လုပ္ႏုိင္မယ္(တနည္းအားျဖင့္ Firmware ႀကီးတခုလုံး full Backup/Restore လုပ္ႏုိင္မယ္)၊ Wipe System / Wipe Data/Factory Reset / Wipe Cache/Dalvik cache / Format Data လုပ္တာေတြ အကုန္ပါပါတယ္ ၊ ေနာက္ /system  /data  /cache ေတြကုိ mount/unmount လုပ္ခြင့္႐ွိမယ္၊ TWRP Recovery Mode ရဲ႔ file manager ကေန file ေတြအားလုံး  access (read/write) လုပ္ခြင့္႐ွိမယ္၊ ေနာက္ထပ္ features ေတြ အမ်ားႀကီး ႐ွိပါေသးတယ္ ဒီေလာက္ဆုိ လုံေလာက္မယ္ ထင္ပါတယ္။
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
- အရင္ဆုံး SourceCode ကေန TWRP Recovery Compilation မလုပ္ခင္ Device tree ထဲမွာ ႃပင္ဆင္စရာေတြ႐ွိပါတယ္၊ TWRP flags ေတြ ထည့္ေပးဖု႔ိလုိအပ္ပါတယ္။ ( ကြၽန္ေတာ္ အဆင္သင့္ေရးေပးထားပါတယ္ ဒီ Repo ထဲမွာ အသုံးဝင္တဲ့ TWRP flags ေတြကုိ https://github.com/zawzaww/android-guide-articles/blob/android/Android/twrp-flags.mk Programming နဲ႔ မစိမ္းတဲ့သူတေယာက္ဆုိ နားလည္ပါလိမ့္မယ္ ဖက္ၾကည့္ေပးပါ Code ေတြ အေပၚမွာ ဘယ္အတြက္သုံးတယ္ဆုိတာ အသုံးဝင္ပုံကုိ comment line ေတြနဲ႔ တခါတည္း နားလည္ေအာင္ ေရးေပးထားပါတယ္၊ အခု Tutorial မွာ ကြၽန္ေတာ္ လက္႐ွိသုံးေနတဲ့ Nexus 6 နဲ႔ ပဲ ဥပမာေပးေျပာသြားမွာပါ )
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
<img src="https://s20.postimg.cc/hdkvxcj5p/Screenshot_from_2017-11-22_14-06-49.png" />

- Kernel Source
- Format: 
```bash
kernel/manufacturer/device_name (or) chipset_name for any android devices
```
- Example: for Nexus 6 ( I used purez kernel, therefore renamed: purez-kernel-shamu )
```bash
kernel/moto/shamu
```
<img src="https://s20.postimg.cc/j6nslbwj1/Screenshot_from_2017-11-22_14-07-23.png" />

- Vendor 
- Format:
```bash
vendor/manufacturer/device_name
```
- Example: for Nexus 6
```bash
vendor/motorola/shamu
```
<img src="https://s20.postimg.cc/watcy4jgt/Screenshot_from_2017-11-22_14-07-41.png" />

- အရင္ဆုံး TWRP flags ေတြန႔ဲ ရင္းႏွီးသြားေအာင္ ဒီမွာ သြားေလ့လာၾကည့္ပါ https://github.com/zawzaww/android-building-tutorials/blob/tutorials/Useful-TWRP-flags.mk
- ႃပီးသြားရင္ Device tree folder ထဲဝင္လုိက္ပါ၊ အဲဒီထဲက BoardConfig.mk မွာ မျဖစ္ေနထည့္သြင္းရမယ့္ TWRP flags ေတြ ေအာက္မွာ ဆက္ေျပာေပးပါမယ္။
- Example: device/moto/shamu/BoardConfig.mk (or) BoardConfigOmni.mk ကုိ TextEditor တခုခုနဲ႔ ဖြင့္လုိက္ႃပီး ေအာက္က လုိအပ္တဲ့ TWRP flags ေတြ add ေပးပါ။ ( TWRP flags ေတြေတာ့ အေသးစိတ္႐ွင္းမျပေတာ့ပါဘူး၊ လြယ္ပါတယ္ Eng လုိပဲ comment line သေဘာမ်ဳိးပဲ ေရးေပးထားပါတယ္ )

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
TARGET_KERNEL_SOURCE := kernel/moto/purez-kernel-shamu
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

Target Recovery fstab for Nexus 6
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
<img src="https://s20.postimg.cc/x0c5amp71/Screenshot_from_2017-11-22_14-08-40.png" />

- ဒီေလာက္ဆုိ TWRP flags ေတြက လုံေလာက္မယ္ ထင္ပါတယ္၊ ဒီထက္မက သိခ်င္ရင္ features ေတြ add ခ်င္ရင္ေတာ့ အေပၚမွာေပးထားတဲ့ Useful-TWRP-flags.mk file ထဲမွာ ဝင္ၿပီး ေလ့လာႏုိင္ပါတယ္။
- Nexus 6 အတြက္ full device tree နဲ႔ Kernel source လုိအပ္ရင္ေတာ့ ကြၽန္ေတာ့္ရဲ႕ GitHub Repo မွာ ယူႏုိင္ပါတယ္
- Device Tree ( https://github.com/zawzaww/twrp-device-shamu )
- PureZ Kernel Source ( https://github.com/purezandroid/purez-kernel-shamu )
- အဲဒါေတြ ႃပီးသြားၿပီဆုိရင္ေတာ့ TWRP Build တဲ့ လုပ္ငန္းစပါေတာ့မယ္။
- ပထမဆုံး Download ထားတဲ့ Source dir ထဲဝင္ၿပီး Terminal ကုိဖြင့္ႃပီး ေအာက္က command ေတြ႐ုိက္ေပးပါ။
```bash
. build/envsetup.sh
```
<img src="https://s20.postimg.cc/hrm7x1qfh/Screenshot_from_2017-11-22_14-09-12.png" />

- ႃပီးသြားရင္ ကုိယ္ build ခ်င္တဲ့ Device ကုိ lunch လုပ္ေပးရပါမယ္။
```bash
lunch
```
<img src="https://s20.postimg.cc/h3dddnp0d/Screenshot_from_2017-11-22_14-09-24.png" />

- lunch လု႔ိ႐ုိက္လုိက္ရင္ Build မယ့္ device name ေတြ တန္းစီၿပီးက်လာပါလိမ့္မယ္၊ နံပါတ္ေလး ႐ုိက္လုိက္႐ုံပါပဲ။ ( ဥပမာ - Nexus 6 က No.12 ဆုိရင္ 12 လု႔ိဆက္႐ုိက္လုိက္ရင္ ရပါၿပီ )
- Example: 
```bash
12
```
<img src="https://s20.postimg.cc/iiey2esod/Screenshot_from_2017-11-22_14-09-59.png" />

- ႃပီးတဲ့ေနာက္ Recovery Build ဖုိ႔အတက္ ေအာက္က command ေလးဆက္႐ုိက္ေပးပါ။
```bash
mka recoveryimage
```
<img src="https://s20.postimg.cc/eyt0coxp9/Screenshot_from_2017-11-22_14-11-26.png" />

- ႃပီးတဲ့ေနာက္ Compilation process လုပ္သြားပါလိမ့္မယ္။

<img src="https://s20.postimg.cc/t58r808l9/Screenshot_from_2017-11-22_14-54-22.png" />

- အားလုံးၿပီးသြားရင္ေတာ့ Output က /out/target/product/your_device_name/recovery.img မွာ recovery.img ထြက္လာပါလိမ့္မယ္။

<img src="https://s20.postimg.cc/chh95lta5/Screenshot_from_2017-11-22_17-11-18.png" />

- DONE

<img src="https://s20.postimg.cc/turjker59/Screenshot_2017-11-22-04-47-48.png" /> 

Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)
