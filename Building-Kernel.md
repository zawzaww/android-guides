# How To Build Kernel For Your Android Device


# Introduction
  အရင္ဆုံး Intro အေနနဲ႔ Kernel ဆုိတာ ဘာလဲ ဘာအတြြြြက္လဲဆုိတာ ႐ွင္းျပ ေပးပါမယ္။ Android OS က Linux Kernel ကုိ Based ထားၿပီး၊ Android ရဲ႕ Kernel က Modified ထားတဲ့ Linux Kernel တခုပါ။ Android မွာသုံံံံံးထား Linux Kernel branch ေတြက Long Term Support(LTS) branch ေတြ ျဖစ္ပါတယ္။  https://www.kernel.org မွာ Long term branch ေတြၾကည့္ႏုိင္ပါတယ္။ ဥပမာ Nexus 5X, 6, 6P မွာဆုိ linux-3.10-y ဆုိတဲ့ branch ကုိ သုံးပါတယ္။
  Android OS က Linux Kernel ေပၚမွာ အေျခခံၿပီး တည္ေဆာက္ထားတာ ျဖစ္ၿပီး၊ Kernel ဆုိတာ OS တခုရဲ႕ အေရးႀကီးတဲ့ အစိတ္အပိုင္းတခုပါ။ CPU, Memory, Disaply စတဲ့ Hardware အစိတ္အပုိင္းေတြ နဲ႔ Software နဲ႔ၾကား ခ်ိတ္ဆက္ၿပီး အလုပ္လုပ္တဲ့ ေနရာမွာ Kernel က အေရႀကီးတဲ့ အပုိင္းမွာ ပါဝင္ပါတယ္။ Android OS Architecture ရဲ႕ Linux Kernel အပုိင္းမွာ Display Driver, Camera Driver, USB Driver, Bluetooth Driver, Audio Driver, Power Management အစ႐ွိသျဖင့္ပါဝင္ပါတယ္(ဥပမာ ေျပာျပတာပါ ေနာက္ထက္က်န္ပါ ေသးတယ္)။ နမူနာေျပာျပရရင္ ကြၽန္ေတာ့္္ရဲ႕ Nexus 5X မွာ ပုံမွန္ built-in ပါတဲ့ Stock Kernel မွာ Double Tap to Wake/Sleep တုိ႔ Disaply နဲ႔ ပတ္သက္တဲ့ KCAL Color Control တုိ႔ Audio နဲ႔ ပတ္သက္တဲ့ Sound Control တုိ႔ မပါပါဘူူူူး၊ ကုိယ့္မွာ Skill ႐ွိရင္ Kernel source တခုုု ကေန အဲဒီ Kernel features ေတြ add ၿပီး ျပန္ compile လုပ္ႏုိင္ပါတယ္။ ဆုိိိလုိတဲ့ သေဘာက အဲဒါေတြက Kernel ပုိင္းက လုပ္ႏုိင္တဲ့ features ေတြပါ။ ဘာလုိ႔ Custom Kernel တခု ျပန္ Compile ရတာလည္း ဆုိရင္ အဲဲဲဲလုိ Kernel features ေတြ လုိခ်င္လုိ႔ပါပဲ။
<center><img src="https://developer.android.com/guide/platform/images/android-stack_2x.png" height="54%" width="54%;"/></center>  


# Requirements
- Linux OS သုံးထားေသာ Computer တလုံး (ကြၽန္ေတာ္ကေတာ့ ubuntu သုံးပါတယ္)
- အေျခခံ Linux command အနည္းအပါး သိရပါမယ္
- ကုိယ္ရဲ႕ ဖုန္းအတြက္ လုိအပ္တဲ့ Kernel Source တခု
- Kernel compile ဖုိ႔အတြက္ လုိအပ္တဲ့ Toolchins (တနည္းအားျဖင့္ ARM/ARM64 GCC Compiler တခု)
- Git သုံးတတ္ရင္ ပုိေကာင္းပါမယ္ ေနာက္ပုိင္း Kernel features ေတြ add ရင္ လုိလာပါလိမ့္မယ္


# Kernel Sources
Kernel source ေတြက ဖုန္းအမ်ဳိးအစာေပၚ မူတည္ၿပီး download ရမယ့္ site ေတြက ကြဲျပားသြားပါလိမ့္မယ္၊ လုိအပ္တဲ့ Link ေတြ ေအာက္မွေပးထားပါမယ္။
- Google Nexus/Pixel ( Qualcomm Chipset Only) : https://android.googlesource.com/kernel/msm
- Google Nexus (For all Chipsets) : https://android.googlesource.com/kernel/
- Sony Xperia : https://developer.sonymobile.com/downloads/xperia-open-source-archives/
- LG : http://opensource.lge.com/index
- Samsung : http://opensource.samsung.com/reception.do
- HTC : https://www.htcdev.com/devcenter/downloads
- Xiaomi : https://github.com/MiCode
- OnePlus : https://github.com/OnePlusOSS
- Motorola : https://github.com/MotorolaMobilityLLC
- ေနာက္တခုက အမ်ဳိးမ်ဳိးေသာ Android Device ေတြရဲ႕ Kernel source ေတြ တေနရာတည္းမွာ ရႏုိင္တဲ့ ေနရကေတာ့ LineageOS ROM Community ႀကီးပဲျဖစ္ပါတယ္။ (ဒါေပမယ့္ တခုေတာ့႐ွိတယ္ အဲဒီ LineageOS Source ကေန Build လုုိုိုိက္တဲ့ Kernel တခုဟာ သူ႔ရဲ႕ ROM နဲ႔ AOSP based ROM ေတြမွာပဲ အလုပ္လုပ္ပါလိိမ့္မယ္၊ ဥပမာ Xiaomi Device ေတြ အေနနဲေျပာရရင္ သူ႔ရဲ႕ StockROM (MIUI) မွာ LineageOS source ကေန build ထားတဲ့ Kernel ကုိ သုံးလုိ႔ရမွာ မဟုတ္ပါဘူး အလုပ္လုပ္မွာ မဟုတ္ပါဘူး၊ ဖုန္းက LineageOS တင္ ထားဖုိ႔လုိပါယ္။
- https://github.com/LineageOS

# Toolchains
Kernel Source ကေန compile ဖုိ႔အတြက္ဆုိရင္ Toolchains တခုလုိအပ္ပါတယ္၊ Toolchains မွာ ကုိယ့္ဖုန္ ရဲ႕ CPU arch ေပၚ မူတည္ၿပီ ARM နဲ႔ ARM64 ဆုိၿပီး ၂မ်ဳိး ႐ွိပါတယ္။ လုိအပ္တဲ့ Link ေတြ ေအာက္မွာ ေပးထားပါတယ္။
- arm : https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/
- arm64 : https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/


# Downloading
ဒီ TUT ကုုိ ကြၽန္ေတာ္မွာ႐ွိတဲ့ Nexus 5X နဲ႔ ဥပမာေပးၿပီး ေျပာသြားမွာပါ။ က်န္တဲ့ဖုန္းေတြ အတြက္ကလည္း သေဘာတရာက တူတူပါပဲ၊ Kernel Source download တဲ့ ေနရာပဲ ကြာသြားမွွွွွာပါ။
- အရင္ဆုံး Terminal ကုိဖြင့္ၿပီး ဒီ command ေလး႐ုိက္လုိက္ပါ။ (Dir တခုေဆာက္ပါမယ္)
```bash
mkdir KernelName
```
```bash
cd KernelName
```

- Nexus 5X အတြက္ Kernel source download ဖုိ႔ အတြက္ ဒီ command ေလး ႐ုိက္လုိက္ပါ။
- အရင္ဆုံး ကုိယ့္ Computer ထဲမွာ git install ထားဖုိ႔ လုိပါတယ္။
```bash
git clone -b android-msm-bullhead-3.10-oreo-r4 --depth=1 https://android.googlesource.com/kernel/msm
```

- ၿပီးရင္ Kernel compile ဖုိ႔အတြက္ Toolchains download ရပါမယ္။ (ဒီေနရာမွာ တခု သတိထားဖုိ႔လုိပါတယ္ ကုိယ္ရဲ႕ဖုန္း CPU arch က arm64 ဆုိ arm64 toolchains ကုိ download ပါ၊ မဟုတ္ဘူး arm ဆုိရင္ arm toolchains ကုိ download ပါ)
```bash
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
```
- အဲဒါေတြအကုန္ၿပီးသြာၿပီ ဆုိရင္ Kernel build ဆုိ အဆင္သင့္ ျဖစ္ပါၿပီ။


# How To Build Kernel
- အရင္ဆုံး Kernel source နဲ႔ toochains ကုိ ပထမက ေဆာက္ထားတဲ့ KernelName (PuerZ-Kernel-N5X) ဆုိတဲ့ Dir ထဲမွာ ႏွစ္ခုလုံး အဆင္သင့္ ႐ွိေနရပါမယ္။
- Toolchain Name ကုိ AOSP-Toolchain လုိ႔ အမည္ေပးလုိက္ၿပီး၊ Nexus 5X Kernel Source Name ကုိ bullhead လုိ႔ အမည္ ေပးလုိက္ပါမယ္။ (အဆင္ေျပသလုိ Rename လုိက္ပါ ျပႆ နာ မ႐ွိပါဘူး၊ တခုပဲ Toolchain Location ျပန္ ေပးတဲ့ ေနရာမွာ အဲဒီ Name ေတြအတုိင္း အတိအက်သိ ဖုိ႔ လုိပါတယ္)
- e.g : Toolchains location
```bush
/home/zawzaw/PureZ-Kernel-N5X/AOSP-Toolchain
```
- e.g : Kernel Source location
```bush
/home/zawzaw/PureZ-Kernel-N5X/bullhead
```
<center><img src="https://s20.postimg.org/c06g0zj8t/Screenshot_from_2017-10-16_11-42-11.png" height="54%" width="54%;"/></center>

- ၿပီးရင္ ကုိယ့္ဖုန္းအတြက္ download ထားတဲ့ Kernel source Folder ထဲ ဝင္လုိက္ပါ။
- Right Click ေထာက္ၿပီး Terminal ေလးကုိ ဖြင့္လုိက္ပါ။
- ပထမဦးဆုံး လုပ္ရမွာ Kernel source ကေန compile ဖုိိိိ႔အတြက္ export ဆုိတဲ့ command ကုိ သုံးၿပီး toolchains ကုိ Set new environment variable သြားလုပ္ရပါမယ္။ (export - Set a New Environmetn Variable)
- Type this command (အဲဒီမွာ bin/ေနာက္ကေကာင္ကုိ toochains prefix လုိ႔ေခၚပါတယ္ အခု Google က ေပးထားတဲ့ Toochain ေတြ ရဲ႕ prefix ေတြကုိ ေျပာျပပါမယ္၊ ARM အတြက္ဆုိရင္ "arm-eabi-" ၊ ARM64 အတြက္ဆုိရင္ "aarch64-linux-android-" ျဖစ္ပါတယ္)
```bush
export CROSS_COMPILE=${HOME}/PureZ-Kernel-N5X/AOSP-Toolchain/bin/aarch64-linux-android-
```

- ကုိယ့္ဖုန္းရဲ႕ CPU arch က arm လား arm64 လား သိထားဖုိ႔ အရင္လုိပါတယ္
- အရင္ဆုံး ကုိယ့္ဖုန္းရဲ႕ arch ကုိ ေျပာေပးဖုိိိ့ လုိပါတယ္။
- Nexus 5X က arm64 ျဖစ္တဲ့အတြက္ ဒီ command ေလး ဆက္႐ုိက္လုိက္ပါ။ (တကယ္လုိ႔ ကုိယ့္ဖုန္းက arm ဆုိရင္ arm64 ေနရာမွာ armလုိ႔ ေျပာင္း ႐ုိက္လုိက္ပါ။
```bush
export ARCH=arm64 && export SUBARCH=arm64
```

- ေနာက္တခုက Kernel source ထဲမွာ Compile ထား output file ေတြ ႐ွိရင္ ႐ွင္း ေပးဖုိ႔ လုိပါတယ္။
```bush
make clean && make mrproper
```
<center><img src="https://s20.postimg.org/ljg4uhorh/Screenshot_from_2017-10-16_10-55-41.png" height="54%" width="54%;"/></center>

- ေနာက္ထက္တခု သိဖုိ႔ကေတာ့ ကုိယ့္ build မယ့္ Kernel ရဲ႕ build kernel configuration ပါ။
- ARM device ဆုိရင္ kernelsource/arch/arm/configs/ ေအာက္မွာ ႐ွိပါတယ္။
- ARM64 device ဆုိရင္ kernelsource/arch/arm64/configs/ ေအာက္မွာ ႐ွိပါတယ္။
- Nexus 5X အတြက္ဆုိရင္ bullhead/arch/arm64/configs/bullhead_defconfig (bullhead_defconfig ဆိုတာ Nexus 5X အတြက္ build မယ့္ kernel configuration အပုိင္းပါပဲ)
- ကုိယ့္ဖုန္းအတြက္ kernel defconfig ကုိ သိခ်င္ရင္ KernelSource/build.config file ေလးကုိ ဖြင့္ၾကည္ႏုိင္ပါတယ္။
- အရင္ဆုံး Kernel compile မလုပ္ခင္ build configuration လုပ္ေပးဖုိ႔ လုိပါတယ္။
```bush
make bullhead_defconfig
```
<center><img src="https://s20.postimg.org/708zt6b31/Screenshot_from_2017-10-16_11-27-13.png" height="54%" width="54%;"/></center>

- ၿပီးရင္ Kernel compile ပါေတာ့မယ္၊ compile ဖုိ႔အတြက္ ေအာက္က command ေလး႐ုိက္လုိက္ပါ။
```bush
make -j$(nproc --all)
```
<center><img src="https://s20.postimg.org/6aq7gqi8d/Screenshot_from_2017-10-16_10-56-47.png" height="54%" width="54%;"/></center>

- Compilation process time က ကုိယ့္ Computer ရဲ႕ CPU core ေပၚမူတည္ၿပီးၾကာႏုိင္ပါတယ္။
- အဲဒါေတြၿပီးသြားရင္ Compiler ကေန Compile လုပ္သြားပါလိမ့္မယ္။
<center><img src="https://s20.postimg.org/w69xzzwxp/Screenshot_from_2017-10-16_11-25-22.png" height="54%" width="54%;"/></center>


- Build လုိက္တဲ့ Kernel zImage ေတြက ARM ဆုိရင္ - kernelsource/arch/arm/boot/ေအာက္မွာ ထြက္ပါတယ္၊ ARM64 ဆုိရင္ - kernelsource/arch/arm64/boot/ေအာက္မွာ ထြက္သြားလိမ့္မယ္။

<center><img src="https://s20.postimg.org/963ank47x/Screenshot_from_2017-10-16_11-42-53.png" height="54%" width="54%;"/></center>

- အဲဒါ ေတြ ေအာင္ျမင္သြာၿပီး ဆုိရင္ ကုိယ္ဖုန္းအတြက္ Kernel Install ဖု႔ိ FlashableZip ဘယ္လုိလုပ္မလဲ ဆုိိိတာ ဆက္ေရးပါမယ္။

# How To Create FlashableZip
- Kernel Build ၿပီးလုိ႔ zImage ေတြ ထြက္လာၿပီဆုိရင္ ကုိယ့္ရဲ႕ဖုန္းအတြက္ CustomRecovery (TWRP) ကေန Install လု႔ိရမယ့္ FlashableZip Create နည္းကုိ ေျပာျပပါမယ္။ XDA Recognized Developer တေယာက္ျဖစ္တဲ့ osm0sis ေရးထားတဲ့ AnyKernel2 - Kernel FlashableZip Template ဆုိတာ႐ွိပါတယ္။ အဲဒီ Template ကေန ကုိယ့္ဖုန္းအတြက္ ဘာေတြ ျပင္ဆင္ဖုိ႔ လုိအပ္လည္းဆုိတာ ဆက္ေျပာပါမယ္။
- AnyKernel2 Documentation နည္းနည္းဖက္ၾကည့္လုိက္ပါ လြယ္ပါတယ္ : https://github.com/osm0sis/AnyKernel2/blob/master/README.md

- အရင္ဆုံး AnyKernel2 ကုိ download လုိက္ပါ။
```bush
git clone https://github.com/osm0sis/AnyKernel2
```
### OR ###

- Recommended for Nexus 5X
```bush
git clone -b bullhead --depth=1 https://github.com/zawzaww/anykernel2-flashable
```
- ဘာေတြလုိအပ္လည္း ဆုိရင္ Kernel name ျပင္ ေပးလုိ႔ရမယ္၊ device name သိရပါမယ္ (eg: LG Nexus 5X ဆုိ device name - bullhead)၊ ကုိယ့္ဖုန္းရဲ႕ boot partition location သိရမယ္၊ ramdisk ထဲမွာဆုိရင္ ကုိယ့္ဖုန္းရဲ႕ fstab.devicename (eg- fstab.bullhead) လုိပါတယ္၊ fstab ဆုိတာ file systems table ကုိေျပာတာပါ။ 
- Nexus 5X အတြက္ fstab.bullhead တခု ဥပမာေပးပါမယ္ : https://github.com/purezandroid/device-lge-bullhead/blob/purez-8.0.0/fstab.bullhead ( အဲလုိပဲ ကုိယ့္ရဲ႕ဖုန္းအတြက္ လုိအပ္ပါတယ္ device-tree/fstab.your-devicename )
- ပထမဦးဆုံး အေနနဲ႔ Compile လုိ႔ရလာတဲ့ Image.gz-dtb (kernelsource/arch/arm64/boot/Image-gz-dtb) ကုိ Copy ကူးၿပီး ခုနက AnyKernel2 Folder ထဲ Paste လုိက္ပါ၊ ၿပီးရင္ zImage-dtb လုိ႔ rename လုိက္​ပါ။
- ျပင္ရမယ့္ ေကာင္ေတြကုိ စေျပာပါမယ္
- Kernel Name : AnyKernel2 ထဲက anykernel2.sh file ေလးကုိ Text Editor တခုခုနဲ႔ ဖြင္လုိက္ၿပီး kernel.string= kernel name ေရးလုိက္ပါ။
```bush
kernel.string=PureZ Kernel by ZawZaw @XDA-Developers
```

- Device Name : anykernel2.sh ကုိဖြင့္ၿပီး device.name1 နဲ႔ device.name2 ေနရာမွာ ကုိယ္႔ဖုန္းရဲ႕ device name ကုိ ေရးလုိက္ပါ။ (ဖုန္း အမ်ဳိးအစာေပၚ မူတည္ၿပီး device name ကြာသြားပါလိမ့္မယ္)
```bush
device.name1=bullhead
```
```bush
device.name2=Bullhead
```

- boot partition : ဒါက အေရးႀကီးပါတယ္ ကုိယ့္ဖုန္းအတြက္ boot partition location ကုိ အတိအက် သိရပါမယ္၊ ဘယ္လုိ႐ွာၾကည့္ႏုိင္လဲ ဆုိရင္ ကုိယ့္ဖုန္းက Root ထားရင္ၾကည့္ႏုိင္ပါတယ္၊ anykernel2.sh ထဲက "block=/dev/block/platform/..." ဆုိတဲ့ line မွာ ျပင္ေပးရမွာပါ။
- For Nexus 5X 
```bush
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
```
<center><img src="https://s20.postimg.org/576jo7bz1/Screenshot_20171016-175722.png" height="54%" width="54%;"/></center>


- fstab.device-name : AnyKernel2 ထဲမွာ ramdisk ဆုိတဲ့ folder ေလး႐ွိပါတယ္၊ အဲဒီ အထဲကုိ အေပၚမွာေျပာခဲ့တဲ့အတုိင္း Nexus 5X အတြက္ fstab.bullhead file ေလး ကုိ သြားထည့္ရမွာပါ။ (အဲဒီ fstab file ေလးထဲမွာ ဘာေတြ အဓိကပါလဲဆုိေတာ့ ကုိယ့္ဖုန္း ရဲ႕ /system, /data, /cache, /firmware, /boot, /recovery, /persist အစ႐ွိတဲ့  <mount_point> partition ေတြ ပါဝင္ပါတယ္၊ ဒီ mount_point ေတြဆုိတာ filesystem path ေတြြြပဲ ျဖစ္ပါတယ္၊ တနည္းအားျဖင့္္ ဒီ file ေလးက ကုိယ့္ဖုန္းရဲ႕ android filesystems table ေလး တခုပါပဲ)
- သူရဲ႕ format ေလးကုိ နည္းနည္းေရးျပပါမယ္။ (Android 4.3 နဲ႔ ေနာက္ပုိင္း version ေတြရဲ႕ ပုံစံပါ)
- ဒီထက္မက ေလ့လာခ်င္ရင္ AOSP site မွာ အျပည့္အစုံဖက္ႏုိင္ပါတယ္ : https://source.android.com/devices/storage/config
```bush
 <src>  <mount_point>  <type>  <mount_flags>  <fs_mgr_flags>
```
 
- E.g for Nexus 5X ( /system )
```bush
 /dev/block/platform/soc.0/f9824900.sdhci/by-name/system       /system         ext4   ro,barrier=1,inode_readahead_blks=8
```
  
- For Nexus 5X (fstab.bullhead) Sample : https://android.googlesource.com/device/lge/bullhead/+/oreo-r6-release/fstab.bullhead


```bush
# Android fstab file.
#<src>                                         <mnt_point>  <type>  <mnt_flags and options>  <fs_mgr_flags>
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK
/dev/block/platform/soc.0/f9824900.sdhci/by-name/system       /system         ext4    ro,barrier=1,inode_readahead_blks=8                             wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/vendor       /vendor         ext4    ro,barrier=1,inode_readahead_blks=8                             wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/userdata     /data           ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic,inode_readahead_blks=8 wait,check,forcefdeorfbe=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/cache        /cache          ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic wait,check
/dev/block/platform/soc.0/f9824900.sdhci/by-name/persist      /persist        ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nodelalloc,nomblk_io_submit,errors=panic wait,notrim
/dev/block/platform/soc.0/f9824900.sdhci/by-name/modem        /firmware       vfat    ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337,context=u:object_r:firmware_file:s0        wait
/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot         /boot           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/recovery     /recovery       emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/misc         /misc           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/modem        /radio          emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/sbl1         /sbl1           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/tz           /tz             emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/rpm          /rpm            emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/sdi          /sdi            emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/aboot        /aboot          emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/imgdata      /imgdata        emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/pmic         /pmic           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/hyp          /hyp            emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/sec          /sec            emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/keymaster    /keymaster      emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/cmnlib       /cmnlib         emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/persistent   /persistent     emmc    defaults                                                        defaults
/devices/soc.0/f9200000.ssusb/f9200000.dwc3/xhci-hcd.0.auto/usb*    auto      auto    defaults                                                        voldmanaged=usb:auto
/dev/block/zram0                                              none            swap    defaults                                                        zramsize=533413200,notrim
/dev/block/platform/soc.0/f9824900.sdhci/by-name/sbl1bak      /sbl1bak        emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/tzbak        /tzbak          emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/rpmbak       /rpmbak         emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/abootbak     /abootbak       emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/pmicbak      /pmicbak        emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/hypbak       /hypbak         emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/keymasterbak /keymasterbak   emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/cmnlibbak    /cmnlibbak      emmc    defaults                                                        defaults
```

- အဲဒါေတြ ေအာင္ျမင္ၿပီ ဆုုိုိုိုိရင္ FlashableZip တခု Create ပါမယ္။
- AnyKernel2 folder ထဲမွာ Right Click ေထာက္ၿပီး Terminal ကုိဖြင့္လုိက္ပါ။
- Type this command
```bush
zip -r9 Your-Kernel-Name.zip * -x README Your-Kernel-Name.zip
```

- ၿပီးသြာရင္ AnyKernel2 folder ထဲမွာ Kernel Flashable Zip တခုထြက္လာပါၿပီ။
- Reday to flash your Kernel Zip from TWRP Recovery for your Android Device
- Done

Regards,
- ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)
