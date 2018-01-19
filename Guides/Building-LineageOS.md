<center><img src="https://www1-lw.xda-cdn.com/files/2017/03/LineageOS-810x298_c.png" height="100%" width="100%;"/></center>

# How To Build LineageOS for Android Devices

# Introduction
   ဒီတခါေတာ့ ကြၽန္ေတာ္ေျပာျပမယ့္အေၾကာင္းအရာကေတာ့ LineageOS SourceCode ကေန ကုိယ့္ရဲ႕ Android Device အတြက္ LineageOS CustomROM တခု ဘယ္လုိ Build မလဲဆုိတဲ့ အေၾကာင္းအရာပါ။ LineageOS ဆုိတာ Android CustomROM Cummunity ေတြထဲမွာ Support Device အမ်ားဆုံး Popular အျဖစ္ဆုံးနဲ႔ အႀကီးဆုံးလု႔ိ ေျပာလု႔ိ ရပါတယ္၊ Android User ေတာ္ေတာ္မ်ားမ်ားလည္း ရင္းႏွီးၾကပါတယ္။ အခုမွ စလုပ္မယ့္သူေတြအတြက္က LineageOS နဲ႔ စၿပီး Build ၾကည့္တာ အလြယ္ကူဆုံး ႃဖစ္ပါတယ္။ ဘာေၾကာင့္လဲ ဆုိေတာ့ LineageOS Team မွာ Developers/Contributors ေတြ အမ်ားႀကီး႐ွိပါတယ္၊ Android Device ေတာ္ေတာ္မ်ားမ်ားရဲ႔ Kernel Source နဲ႔ Device tree ေတြ အမ်ားႀကီး႐ွိပါတယ္၊ အျမဲ Update လုပ္ေပးေနပါတယ္၊ ကုိယ္တုိင္ Source ကေန Modification ပုိင္း လုပ္တာ မကြၽမ္းက်င္ဘူဆုိရင္ အဆင္သင့္ယူလု႔ိရပါတယ္။ ဘယ္မွာ သြားယူရမလဲဆုိရင္ https://github.com/LineageOS/ ေအာက္မွာ ကုိယ့္ဖုန္းရဲ႕ device name အလုိက္ ႐ွာလု႔ိရပါတယ္။ အခု ကြၽန္ေတာ္ရဲဲဲ႕ Guide ကုိ ဖက္ႃပီးသြားရင္ တျခားေသာ Android CustomROM အမ်ားအျပားပါ build တတ္သြားပါလိမ့္မယ္။ တခုပဲကြဲျပားသြားပါလိမ့္မယ္ Android OS SourceCode ယူရတဲ့ ေနရာနဲ႔ တခ်ဳိိိိိ႕ေသာ linux make command ေတြ ကြာသြားပါလိမ့္မယ္။ (Example: Android CustomROM Teams - OmniROM, AOSiP, AOKP, AOSP Extended, Dirty Unicorns, ResurrectionRemix and etc...) တခုေတာ့ သတိေပးထားပါရေစ Android OS SourceCode ရဲ႕ filesize က 20GB နဲ႔ အထက္မွာ ႐ွိပါတယ္။ အဲဒါေၾကာင့္ Internet ေကာင္းမွပဲ အဆင္ေျပပါလိမ့္မယ္။ Build တဲ့ ေနရာမွာ Linux မွာေရာ Mac မွာေရာ build လုိ႔ရပါတယ္ ကြၽန္ေတာ္ကေတာ့ Linux နဲ႔ပဲ target ထားၿပီးေျပာသြားမွာျဖစ္ၿပီး၊ ခုေလာေလာဆယ္ေတာ့ ubuntu 17.04 ပဲ သုံးျဖစ္ပါတယ္၊ အဲဒါေၾကာင့္ ubuntu ေပၚမွာ build တာပဲ ဥပမာေပး ေျပာသြားမွာပါ၊ Build မယ့္ target Android Device က Google Nexus 5X နဲ႔ ဥပမာေပးၿပီး ေျပာျပသြားမွာ ျဖစ္ပါတယ္။
   
# LineageOS Android Distribution
## Information
- LinageOS Official Website (https://lineageos.org)
- LineageOS Wiki & Documentation (https://wiki.lineageos.org)
- LineageOS Downloads: for support Devices (https://download.lineageos.org)
- LineageOS XDA Forum (https://forum.xda-developers.com/lineage)
- LineageOS Developers and Contributors (https://wiki.lineageos.org/contributors.html)
## Project
- LineageOS Project SourceCode (https://github.com/LineageOS)
## Support
- LineageOS Twitter (https://twitter.com/lineageandroid)
- LineageOS G+ Community (https://plus.google.com/+LineageOS)
- LineageOS Facebook (https://www.facebook.com/LineageAndroid)

# Requirements
- Linux OS သုံးထားတဲ့ Computer တလုံး႐ွိရပါမယ္
- OpenJDK Install ထားရပါမယ္
- Python 2.7+ Install ထားရပါမယ္ (ဘာလုိ႔လဲဆုိေတာ့ Google ရဲ့ git-repo က Python နဲ႔ေရးထားတာ ျဖစ္ပါတယ္၊ အဲဒါေၾကာင့္ Python Install လုပ္မထားရင္ git-repo က အလုပ္မလုပ္ပါဘူး)
- Git အသုံးျပဳတတ္ရပါမယ္
- Google ရဲ႕ git-repo လည္း သုံးတတ္ရပါမယ္။ git-repo အေၾကာင္းကုိ ဒီမွာဝင္ဖက္ႏုိင္ပါတယ္... https://code.google.com/archive/p/git-repo/ ၿပီးသြားရင္ git-repo command ေတြကုိ ဒီမွာ ေလ့လာၾကည့္ပါ... https://source.android.com/source/using-repo 
(git-repo ဆုိတာ Git ေပၚမွာ အေျခခံၿပီး Google က develop ထားတဲ့ tool တခုပါ၊ Android ROM Development မွာ အရမ္းအသုံးဝင္ပါတယ္၊ [ git-repo - Multiple Repository Tool ] လုိ႔ေခၚပါတယ္၊ သူ႔ရဲ႕ အသုံးဝင္ပုံက Repo တခုေဆာက္ၿပီး အဲဒီထဲမွာ xml file ေလးတခုေဆာက္ၿပီး ကုိယ္လုိခ်င္တဲ့ ကုိယ္ remote လုပ္ခ်င္တဲ့ repo ေတြကုိအမ်ာႀကီးကုိ link ေပးၿပီး repo sync ဆုိတဲ့ command ကုိသုံးၿပီး ကုိယ့္ရဲ႕ Local machine ထဲကုိ တေနရာတည္းမွာပဲ Repository ေတြအမ်ာႀကီးကုိ download ဆြဲလုိ႔ရပါတယ္၊ သေဘာက ROM တခု build ဖုိ႔ လုိအပ္တဲ့ Android SourceCode Repository ေတြက အမ်ားႀကီးပါ အဲဒါကုိ တခုခ်င္းလုိက္ git clone မေနပဲ xml file ေလးကေန Repository အမ်ားႀကီးစုၿပီး Local ထဲကုိ download ဆြဲလုိက္တဲ့ သေဘာပါပဲ)

# Setup Your Environment
## Step 1: Installation OpenJDK
- ပထမဦးဆုံး OpenJDK ကုိ ကုိယ့္ရဲ့ Computer မွာ Install ထားဖုိ့ လုိပါတယ္၊ Terminal ကုိဖြင့္ၿပီး ေအာက္ပါ command ေလးေတြ ႐ုိက္ေပးပါ။

```bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-jre
```
OpenJDK Install တဲ့ ေနရာမွာ နည္းနည္းေျပာျပပါမယ္၊ ကုိယ့္ Build မယ့္ Android Version ေပၚ မူတည္ၿပီး Install ရမယ့္ OpenJDK version ေတြ ကြဲသြားပါလိမ့္မယ္။
- Android Nougat ကေန Android Oreo ဆုိ ( OpenJDK 8 ကုိ Install ေပးပါ )
- Android Lollipop ကေန Android Marshmallow ဆုိ ( OpenJDK 7 ကုိ Install ေပးပါ )
- Android Gingerbread ကေန Android KitKat ဆုိ ( OpenJDK 6 ကုိ Install ေပးပါ )
( သူ႔ရဲ႕ ေအာက္က Android version အတြက္ေတာ့ မေျပာေတာ့ပါဘူး ဘယ္သူမွလည္း Build မွာ မဟုတ္ေတာ့ပါဘူး )

## Step 2: Installation Python
- ေနာက္တဆင့္ကေတာ့ Python install ေပးဖု႔ိ လုိပါတယ္၊ Python 2.7 ေလာက္ဆုိ အဆင္ေျပပါၿပီ။ ( Python 3+ ဆုိ git-repo အတြက္ သိပ္အဆင္မေျပပါဘူး အဲဒါေၾကာင့္ 2.7 ပဲ Install ေပးပါ )
```bash
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```

## Step 3: Installation Build-Tools
- လုိအပ္တဲ့ build tools ေတြ install ဖုိ႔ ေအာက္ပါ command ေလးကုိ terminal မွာ ႐ုိက္ေပးပါ။
```bash
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
```

## Step 4: Installation Git and Repo (git-repo)
- အရင္ဆုံး Git install မလုပ္ရေသးဘူးဆုိရင္ လုပ္ေပးပါ။ (Install ထားၿပီးသားဆုိရင္ ဒီအဆင့္ကုိ ထပ္လုပ္စရာမလုိပါဘူး)
```bash
sudo apt-get install git-core
```
- Setting your username and email in Git
- Format:
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```
- Example:
```bash
git config --global user.name "zawzaw"
git config --global user.email "zawzaw@gmail.com"
```

- Google ရဲ႕ git-repo ကုိ install လုပ္ေပးရပါမယ္။ (အသုံးဝင္ပုံကုိ Introduction မွာ ႐ွင္းျပထားၿပီးျဖစ္လု႔ိ ထပ္မေျပာေတာ့ပါဘူး)
```bash
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
အဲဒါေတြ အကုန္ၿပီးသြားၿပီ ဆုိရင္ေတာ့ ROM တခု build ဖုိ႔အတြက္ Setup Environment ပုိင္းက ျပည့္စုံသြားပါၿပီ။

# Downloading the Sources
- Android OS ႀကီးတခုလုံး အတြက္ လုိအပ္ Repositories အမ်ားႀကီးကုိ Android Plaform Manifest Repo ကေန Download လုပ္မွာ ႃဖစ္ပါတယ္။ 
- အဆုိပါ Android Platform Manifest မွာ ဘာေတြပါလဲဆုိေတာ့ Android OS အတြက္ လုိအပ္တဲ့ Repos ေတြ အကုန္ပါပါတယ္ ( frameworks repos, bootable recovery, kernel trees(for AOSP), device trees(for AOSP), system repos, hardware repos, system packages apps, Prebuilt GCC Toolchains and buildtools, external repos, vendor and tools repos and more ) filesize က 20GB နဲ႔ အထက္မွာ႐ွိပါတယ္ မူးရင္း AOSP SourceCode ရဲ႕ filesize ဒီထက္မက မ်ားပါတယ္
- LineageOS Main SourceCode - All Repos (https://github.com/LineageOS)
- LineageOS - Android Platform Manifest for downloading the sources (https://github.com/LineageOS/android)

- ပထမဆုံး လုပ္ရမွာက Sources ေတြ download ဖုိ႔ Directory တခုေဆာက္ပါမယ္
```bash
mkdir LineageOS-Project
```
```bash
cd LineageOS-Project
```

- LineageOS SourceCode ကုိ Download ပါေတာ့မယ္။
- -b ေနာက္ကေကာင္က 'lineage-15.0' က branch name ပါ။ 
- lineage-15.1(Coming soon...) က Oreo(8.1.0+) build အတြက္ပါ၊ lineage-15.0 က Oreo(8.0.0) build အတြက္ပါ၊ cm-14.0 သုံးရင္ Nougat(7.0) build အတြက္ပါ၊ cm-14.1 သုံးရင္ Nougat(7.1.1-7.1.2) build အတြက္ပါ၊ ၾကဳိက္တဲ့ Android version ကုိ Build ႏုိင္ပါတယ္။
- Android 8.0.0 (Oreo) version Build ခ်င္သူမ်ားအတြက္က "lineage-15.0" branch ကုိ သုံးေပးပါ
```bash
repo init -u git://github.com/LineageOS/android.git -b lineage-15.0
```
(OR)

- Android 8.1.0 (Oreo) version Build ခ်င္သူမ်ားအတြက္က "staging/lineage-15.1" branch ကုိ သုံးေပးပါ
```bash
repo init -u git://github.com/LineageOS/android.git -b staging/lineage-15.1
```

- Sources ေတြ download ဖုိ႔ ေအာက္က command ေလး ႐ုိက္ေပးပါ။

```bash
repo sync
```
အဲဒီေနာက္မွာေတာ့ Sources ေတြ Downloading လုပ္ေနတဲ့ အပုိင္းပါ၊
SourceCode ေတြ Download တဲ့ process ကေတာ့ Internet connection ေပၚမွာ မူတည္ၿပီးၾကာပါလိမ့္မယ္။

# Building LineageOS
- Official Documentation: LineageOS Building for Nexus 5X (https://wiki.lineageos.org/devices/bullhead/build)
- အရင္ဆုံး Source ကေန Compilation မလုပ္ခင္ ၾကဳိတင္ျပင္ဆင္ရမယ့္ အရာေတြကုိ ေျပာျပေပးပါမယ္။
- အေပၚမွာ Introduction မွာ ေျပာခဲ့သလုိပါပဲ ကုိယ့္ Android Phone အတြက္ လုိအပ္တဲ့ Kernel Source နဲ႔ Device tree Repo ေတြကုိ github.com/LineageOS/ ေအာက္မွာ သြား႐ွာလု႔ိ ရပါတယ္။
- ဘယ္လုိ ႐ွာရမလဲ ေျပာပါမယ္၊ Name ေပးပုံ ေပးနည္းကုိ သိရင္ ရပါၿပီ။ 
- Example for Nexus 5X ( Nexus 5X ရဲ႕ device name ကုိ bullhead လု႔ိေခၚပါတယ္ )
- Format: Device tree
```bash
android_device_manufacturer_devicename
```
- Example: Device tree for Nexus 5X
```bash
android_device_lge_bullhead
```
- Format: Kernel Source
```bash
android_kernel_manufacturer_devicename
```
- Example: Kernel source for Nexus 5X
```bash
android_kernel_lge_bullhead
```

- ပထမဆုံး လုိအပ္တာက ကုိယ့္ဖုန္းရဲ႕ Device tree ပါ
- Location က ဘယ္မွာ သြားထည့္ရမလဲဆုိရင္ Download ထားတဲ့ Source dir ေအာက္က /device ေအာက္မွာ သြားထည့္ေပးရမွာပါ။
- Format:
```bash
/device/manufacturer/device_name
```
- Example for Nexus 5X:
```bash
/device/lge/bullhead
```
- ROM build တဲ့ေနရာမွာ Kernel ပုိင္းက ႏွစ္မ်ဳိးကြဲပါမယ္၊ Kernel source ကေန build တာရယ္ အဆင္သင့္ build ထားၿပီးသား prebuilt kernel ကေန Build တာဆုိၿပီး ႐ွိပါတယ္၊ kernel source ကေန build တာပဲ အၾကံေပးတယ္။
- ၿပီးတဲ့ေနာက္ Kernel source ကေန build မယ္ဆုိရင္ Device tree ထဲက ျပင္ဆင္စရာ႐ွိပါတယ္၊ Nexus 5X အေနနဲ႔ ေျပာပါမယ္ /device/lge/bullhead/BoardConfig.mk ကုိ TextEditor တခုနဲ႔ ဖြင့္ၿပီး ေအာက္က code ေလးေတြ ထပ္ျဖည့္လုိက္ပါ။ (အခုအဆင့္က ကုိယ္တုိင္ Modified ႏုိင္ေအာင္ သိေအာင္ ေျပာေပးတာပါ၊ LineageOS source ကေနဆုိ မလုိပါဘူး သူတုိ႔ရဲ႔ Official Contributor ေတြ အဆင့္သင့္ လုပ္ေပးထားပါတယ္၊ သူတု႔ိ Support ထားတဲ့ Device အတြက္ဆုိရင္ လုပ္စရာမလုိေတာ့ပါဘူး)
```bash
# Inline Kernel Build
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/lge/bullhead
TARGET_KERNEL_CONFIG := purez_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
```
Explanation:
```bash
ဒီအဆင့္က ကြၽန္ေတာ္ ပထမဆုံး ေရးထားခဲ့တဲ့ Building-Kernel ဆုိတဲ့ Tutorial ကုိ ဖက္ၿပီးမွ အဆင္ေျပပါလိမ့္မယ္။
Line 1 - Kernel ကုိ Compile မယ့္ Toolchain location ကုိ ေပးတာပါ
Line 2 - ကုိယ္သုံးမယ့္ Toolchain ရဲ႕ Kernel toolchain prefix လုိ႔ေခၚပါတယ္ ( သိပ္နားမလည္ဘူးဆုိရင္ Kernel Compilation Tutorial မွာ ေလ့လာၾကည့္ပါ )
Line 3 - ဒါကေတာ့ ကုိယ္ Build မယ့္ kernel source location ပါ
Line 4 - Kernel build ဖုိ႔အတြက္ kernel configuration လုပ္ေပးရပါတယ္၊ အဲဒီအေၾကာင္းက Kernel config အပုိင္းပါ
Line 5 - ကုိယ့္ဖုန္းအတြက္ output ထြက္မယ့္ Kernel image name ကုိ အတိအက်ေရးေပးရပါမယ္
```

- ေနာက္တဆင့္က Kernel source အပုိင္းပါ သြားထည့္ေပးရမယ့္ Location က Source dir ေအာက္က /kernel ေအာက္မွာ သြားထည့္ေပးရမွာပါ။
- Format:
```bash
/kernel/manufacturer/device_name
```
- Example: for Nexus 5X ( ဒီ Location က Device tree ထဲမွာ Kernel source path လမ္းေၾကာင္း ျပန္ေပးရမွာပါ )
```bash
/kernel/lge/bullhead
```

- vendor အပုိင္းပါ အဲဒီေကာင္က Source dir ေအာက္က /vendor ေအာက္မွာ သြားထည့္ေပးရမွာပါ။
- Format:
```bash
/vendor/manufacturer/device_name
```
- Example: for Nexus 5X
```bash
/vendor/lge/bullhead
```

ဒါေတြျပည့္စုံသြားရင္ေတာ့ LineageOS CustomROM တခု Build ဖုိ႔ အဆင္သင့္ ျဖစ္ပါၿပီ။

- ဒါကေတာ့ ေနာက္ဆုံးအဆင့္ေရာက္ပါၿပီ၊ Download ထားတဲ့ Source Dir ထဲ ဝင္လုိက္ၿပီး Terminal ကုိ ဖြင့္လုိက္ပါ၊ ေအာက္က command ေလး ႐ုိက္ေပးပါ။
```bash
. build/envsetup.sh
```
(OR)
```bash
source build/envsetup.sh
```

- ၿပီးရင္ ေအာက္က command ေလး ဆက္႐ုိက္ေပးပါ။ ( AOSP တုန္းက lunch ဆုိတဲ့ command နဲ႔တူပါတယ္ )
- Format:
```bash
breakfast <device_name>
```
- Example: for Nexus 5X (bullhead)
```bash
breakfast bullhead
```
- Note: ဒီေနရာမွာ မလုိတာေတြ ခ်န္ထားခဲ့တာ ႐ွိပါတယ္ Compilation process time ျမန္ေအာင္ "ccache" Setup လုပ္တဲ့ အပုိင္းေတြ မေျပာေတာ့ပါဘူး ႐ႈပ္သြားမွာဆုိးလု႔ိပါ၊ ေနာက္တခုက Android CustomROM Team တခုနဲ႔ တခုက 
သူတု႔ိ ROM Build ဖု႔ိအတြက္ make build command ေတြက မတူၾကပါဘူး ဘာလု႔ိလဲဆုိေတာ့ AOSP/platform/build (https://android.googlesource.com/platform/build) ဆုိတဲ့ Repo တခု ႐ွိပါတယ္ သူက OS ႀကီးတခုလုံးအတြက္ build System တခုပါ Makefile နဲ႔ ေရးထားပါတယ္ နားလည္ရင္ စိတ္ၾကဳိက္ျပဆင္ခြင့္႐ွိပါတယ္ အဲဒီမွာ make build command ေတြ ဖန္တီးႏုိင္ပါတယ္။
- Screenshots ေတြကုိ ထပ္ႃပီး Upload မလုပ္ေတာ့ပါဘူး တူတူပါပဲ AOSP Building Guide မွာ ၾကည့္ႏုိင္ပါတယ္...https://github.com/zawzaww/techxmm-articles/blob/techx-android/Guides/Building-AOSP-ROM.md
- LineageOS 14.1 နဲ႔ အထက္အတြက္ Jack Configure လုပ္ေပးဖု႔ိ လုိအပ္ပါတယ္
```bash
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
```

- ေနာက္ဆုံးအဆင့္ အေနနဲ႔ ROM Build ဖုိ႔အတြက္ ေအာက္က command ေလး ဆက္႐ုိက္ေပးပါ ( bullhead ဆုိတဲ့ေနရာမွာ ကုိယ္ဖုန္းရဲ႔ device name ေပၚ မူတည္ၿပီး ကြဲျပားသြားပါလိမ့္မယ္ )
```bash
croot
brunch bullhead
```
- Output ထြက္မယ့္ေနရာကေတာ့ ေအာက္ပါ location အတုိင္း ျဖစ္ပါတယ္
```bash
Output - /out/target/product/bullhead/ ေအာက္မွာ flashablezip ထြက္လာပါလိမ့္မယ္
```
Compilation process time က Computer ရဲ႕ CPU core ေပၚ မူတည္ၿပီး ၾကာပါလိမ့္မယ္။ 

Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)

Copyright (C) 2017-2018, ZawZaw.
