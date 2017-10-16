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
Kernel Source ကေန compile ဖုိ႔အတြက္ဆုိရင္ Toolchain တခုလုိအပ္ပါတယ္၊ Toolchain မွာ ကုိယ့္ဖုန္ ရဲ႕ CPU arch ေပၚ မူတည္ၿပီ ARM နဲ႔ ARM64 ဆုိၿပီး ၂မ်ဳိး ႐ွိပါတယ္။ လုိအပ္တဲ့ Link ေတြ ေအာက္မွာ ေပးထားပါတယ္။
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

- ၿပီးရင္ Kernel compile ဖုိ႔အတြက္ Toolchains download ရပါမယ္။ (ဒီေနရာမွာ တခု သတိထားဖုိ႔လုိပါတယ္ ကုိယ္ရဲ႕ဖုန္း CPU arch က arm64 ဆုိ arm64 toolchain ကုိ download ပါ၊ မဟုတ္ဘူး arm ဆုိရင္ arm toolchain ကုိ download ပါ)
```bash
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
```
- အဲဒါေတြအကုန္ၿပီးသြာၿပီ ဆုိရင္ Kernel build ဆုိ အဆင္သင့္ ျဖစ္ပါၿပီ။


# How To Build Kernel
- အရင္ဆုံး Kernel source နဲ႔ toochains ကုိ ပထမက ေဆာက္ထားတဲ့ KernelName (PuerZ-Kernel-N5X) ဆုိတဲ့ Dir ထဲမွာ ႏွစ္ခုလုံး အဆင္သင့္ ႐ွိေနရပါမယ္။
- Toolchain Name ကုိ AOSP-Toolchain လုိ႔ အမည္ေပးလုိက္ၿပီး၊ Nexus 5X Kernel Source Name ကုိ bullhead လုိ႔ အမည္ ေပးလုိက္ပါမယ္။ (အဆင္ေျပသလုိ Rename လုိက္ပါ ျပႆ နာ မ႐ွိပါဘူး၊ တခုပဲ Toolchain Location ျပန္ ေပးတဲ့ ေနရာမွာ အဲဒီ Name ေတြအတုိင္း အတိအက်သိ ဖုိ႔ လုိပါတယ္)
- e.g : Toolchain location
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
- ပထမဦးဆုံး လုပ္ရမွာ Kernel source ကေန compile ဖုိိိိ႔အတြက္ export ဆုိတဲ့ command ကုိ သုံးၿပီး toolchain ကုိ Set new environment variable သြားလုပ္ရပါမယ္။ (export - Set a New Environmetn Variable)
- Type this command (အဲဒီမွာ bin/ေနာက္ကေကာင္ကုိ toochain prefix လုိ႔ေခၚပါတယ္ အခု Google က ေပးထားတဲ့ Toochain ေတြ ရဲ႕ prefix ေတြကုိ ေျပာျပပါမယ္၊ ARM အတြက္ဆုိရင္ "arm-eabi-" ၊ ARM64 အတြက္ဆုိရင္ "aarch64-linux-android-" ျဖစ္ပါတယ္)
```bush
export CROSS_COMPILE=${HOME}/PureZ-Kernel-N5X/AOSP-Toolchain/bin/aarch64-linux-android-
```

- ကုိယ့္ဖုန္းရဲ႕ CPU arch က arm လား arm64 လား သိထားဖုိ႔ အရင္လုိပါတယ္
- အရင္ဆုံး ကုိယ့္ဖုန္းရဲ႕ arch ကုိ ေျပာေပးဖုိိိ့ လုိပါတယ္။
- Nexus 5X က arm64 ျဖစ္တဲ့အတြက္ ဒီ command ေလး ဆက္႐ုိက္လုိက္ပါ။ (တကယ္လုိ႔ ကုိယ့္ဖုန္းက arm ဆုိရင္ arm64 ေနရာမွာ armလုိ႔ ေျပာင္း ႐ုိက္လုိက္ပါ။
```bush
export ARCH=arm64
```
```bush
export SUBARCH=arm64
```
- ေနာက္တခုက Kernel source ထဲမွာ Compile ထား output file ေတြ ႐ွိရင္ ႐ွင္း ေပးဖုိ႔ လုိပါတယ္။
```bush
make clean
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

Regards,
- Z @XDA-Developers
