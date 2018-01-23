<img src="https://s20.postimg.org/mynqibckt/Android-_Open-_Source-_Project-710x277.jpg" height="100%" width="100%;"/>

# How To Build an AOSP ROM for Android Devices

## AOSP - Android Open Source Project
## Building Pure Android OS

# Introduction
   ဒီတခါေတာ့ ကြၽန္ေတာ္ေျပာျပမယ့္အေၾကာင္းအရာကေတာ့ AOSP SourceCode ကေန ကုိယ့္ရဲ႕ Android Device အတြက္ Pure Android OS တခု ဘယ္လုိ Build မလဲဆုိတဲ့ အေၾကာင္းအရာပါ။ အခုနည္းကုိ သိသြားၿပီဆုိရင္ တျခားေသာ AOSP based ROM ေတြေရာ LineageOS based ROM ေတြေရာ build တတ္သြားပါလိမ့္မယ္၊ တခုပဲကြဲျပားသြားတာပါ Android SourceCode ယူရတဲ့ ေနရာပဲကြဲသြားတာပါ။ တခုေတာ့ သတိေပးထားပါရေစ Android ရဲ႕ SourceCode ေတြရဲ႕ filesize က 20GB နဲ႔ အထက္မွာ ႐ွိပါတယ္။ အဲဒါေၾကာင့္ Internet ေကာင္းမွပဲ အဆင္ေျပပါလိမ့္မယ္။ Build တဲ့ ေနရာမွာ Linux မွာေရာ Mac မွာေရာ build လုိ႔ရပါတယ္ ကြၽန္ေတာ္ကေတာ့ Linux နဲ႔ပဲ target ထားၿပီးေျပာသြားမွာျဖစ္ၿပီး၊ ခုေလာေလာဆယ္ေတာ့ ubuntu 17.04 ပဲ သုံးျဖစ္ပါတယ္၊ အဲဒါေၾကာင့္ ubuntu ေပၚမွာ build တာပဲ ဥပမာေပး ေျပာသြားမွာပါ၊ Build မယ့္ target Android Device က Nexus 5X နဲ႔ ဥပမာေပးၿပီး ေျပာျပသြားမွာ ျဖစ္ပါတယ္။

# Requirements
- Linux OS သုံးထားတဲ့ Computer တလုံး႐ွိရပါမယ္
- OpenJDK Install ထားရပါမယ္
- Python 2.7+ Install ထားရပါမယ္ ( ဘာလုိ႔လဲဆုိေတာ့ Google ရဲ့ git-repo က Python နဲ႔ေရးထားတာပါ၊ အဲဒါေၾကာင့္ Python Install လုပ္မထားရင္ git-repo က အလုပ္မလုပ္ပါဘူး )
- Git အသုံးျပဳတတ္ရပါမယ္
- Google ရဲ႕ git-repo လည္း သုံးတတ္ရပါမယ္။ 
git-repo အေၾကာင္းကုိ ဒီမွာဝင္ဖက္ႏုိင္ပါတယ္...
https://code.google.com/archive/p/git-repo/
ၿပီးသြားရင္ git-repo command ေတြကုိ ဒီမွာ ေလ့လာၾကည့္ပါ... https://source.android.com/source/using-repo
( git-repo ဆုိတာ Git ေပၚမွာ အေျခခံၿပီး Google က develop ထားတဲ့ tool တခုပါ၊ Android ROM Development မွာ အရမ္းအသုံးဝင္ပါတယ္၊ [ git-repo - Multiple Repository Tool ] လုိ႔ေခၚပါတယ္၊ သူ႔ရဲ႕ အသုံးဝင္ပုံက Repo တခုေဆာက္ၿပီး အဲဒီထဲမွာ .xml file ေလးတခုေဆာက္ၿပီး ကုိယ္လုိခ်င္တဲ့ ကုိယ္ remote လုပ္ခ်င္တဲ့ repo ေတြကုိအမ်ာႀကီးကုိ link ေပးၿပီး repo sync ဆုိတဲ့ command ကုိသုံးၿပီး၊ ကုိယ့္ရဲ႕ Local machine ထဲကုိ တေနရာတည္းမွာပဲ Repository ေတြအမ်ာႀကီးကုိ download ဆြဲလုိ႔ရပါတယ္၊ သေဘာက ROM တခု build ဖုိ႔ လုိအပ္တဲ့ Android SourceCode Repository ေတြက အမ်ားႀကီးပါ အဲဒါကုိ တခုခ်င္းလုိက္ git clone မေနပဲ .xml file ေလးကေန Repository အမ်ားႀကီးစုၿပီး Local ထဲကုိ download ဆြဲလုိက္တဲ့ သေဘာပါပဲ။ )

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
- အရင္ဆုံး Git install မလုပ္ရေသးဘူးဆုိရင္ လုပ္ေပးပါ။ ( Install ထားၿပီးသားဆုိရင္ ဒီအဆင့္ကုိ ထပ္လုပ္စရာမလုိပါဘူး )
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

- Google ရဲ႕ git-repo ကုိ install လုပ္ေပးရပါမယ္။ ( အသုံးဝင္ပုံကုိ အေပၚမွာ ႐ွင္းျပထားၿပီးျဖစ္လု႔ိ ထပ္မေျပာေတာ့ပါဘူး )
```bash
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
အဲဒါေတြ အကုန္ၿပီးသြားၿပီ ဆုိရင္ေတာ့ ROM တခု build ဖုိ႔အတြက္ Setup Environment ပုိင္းက ျပည့္စုံသြားပါၿပီ။

## Downloading the Sources
Sources ေတြ download တဲ့ ေနရာမ်ာ လုိအပ္တဲ့အရာေတြကုိ ေျပာျပစရာ႐ွိပါတယ္။ ( CustomROM တခု build ဖု႔ိအတြက္ အဲဒါေတြက မ႐ွိမျဖစ္ လုိအပ္တာေတြပါ )
- Android OS ႀကီးတခုလုံး အတြက္ လုိအပ္ Repository ေတြပါတဲ့ Android Plaform Manifest ( ဘာေတြပါလဲဆုိေတာ့ Android OS အတြက္ လုိအပ္တဲ့ framework ေတြ၊ lib ေတြ၊ system apps package ေတြ၊ device tree ေတြ kernel tree ေတြ၊ build tools ေတြ toochains GCC compiler ေတြ အကုန္ပါပါတယ္ filesize က 20GB နဲ႔ အထက္မွာ႐ွိပါတယ္ )
- Google ရဲ႕ Device ေတြ ျဖစ္တဲ့ Nexus နဲ႔ Pixel မဟုတ္ရင္ တျခား Android Device ေတြအတြက္ဆုိရင္ Device tree နဲ႔ Kernel source ေတြ ႐ွာထားဖုိ႔ လုိပါတယ္၊ Google ရဲ႕ devices ေတြအတြက္က AOSP repo ထဲမွာ device tree ေတြက တခါတည္းပါၿပီးသားပါ။ ( ခုမွ စလုပ္တဲ့သူအေနနဲ႔ အေကာင္းဆုံး အၾကံေပးခ်င္တာေတာ့ အႀကီးဆုံး ROM Community ႀကီး ျဖစ္တဲ့ LineageOS ေအာက္မွာ သြား႐ွာတာ အေကာင္းဆုံးပါ https://github.com/LineageOS ကုိယ္တုိင္ ထုတ္လုိ႔ရပါတယ္ ကုိယ့္ဖုန္းရဲ႕ hardware arch ေပၚမူတည္ၿပီး Device tree ထုတ္နည္းကုိ ေနာက္မွသက္သက္ေရးေပးပါမယ္ )
- ၿပီးရင္ Android device ေတြ အတြက္ proprietary vendor file ေတြ ပါလုိအပ္ပါတယ္။ ( တနည္းအားျဖင္ အဲဒီေကာင္က Non-opensource file ေတြပါ၊ ကုိယ့္ဖုန္း ရဲ႕ firmware ထဲကေန ျပန္ထုတ္ရတာပါ Example for Nexus 5X...https://github.com/PureNexusProject/proprietary_vendor_lge ဥပမာအေနနဲ႔ အဲဒီ Repo ထဲမွာ ဝင္ၾကည့္ပါ )

- ပထမဆုံး လုပ္ရမွာက Sources ေတြ download ဖုိ႔ Directory တခုေဆာက္ပါမယ္
```bash
mkdir AOSP-ROM-Project
```
```bash
cd AOSP-ROM-Project
```

- Android SourceCode ေတြ download လုပ္ပါေတာ့မယ္။ ( ဒီေနရာမွာ ေျပာစ႐ွိပါတယ္ Google Git က AOSP Repo ကေန download လုပ္ရင္ Size အရမ္းမ်ားပါတယ္၊ အဲဒါေၾကာင့္ ကြၽန္ေတာ့ GitHub မွာေဆာက္ထားတဲ့ Personal AOSP Repo ကေန down ရင္ ပုိသက္သာပါလိမ့္မယ္၊ ဘာလုိ႔လဲဆုိေတာ့ ကြၽန္ေတာ့္ရဲ႕ GitHub AOSP Repo ထဲမွာ မလုိအပ္တဲ့ project path ေတြ ေလ်ာ့ထားတာပါ၊ သေဘာပါပဲ ႏွစ္သက္တဲ့ Repo ကေန download ဆြဲပါ။ )
- ပထမဦးဆုံး AOSP SourceCode ေတြ ႐ွိတဲ့ေနရာကုိ သိရပါမယ္...https://android.googlesource.com/platform/manifest
- -b ေနာက္က ကုိယ့္ Build မယ့္ branch ပါ။ ( တနည္းအားျဖင့္ ကုိယ္ Build ခ်င္တဲ့ Android version ပါ r (r_23) ဆုိတာ Release ကုိ ဆုိလုိတာပါ )
- ဒီေနရာမွာ သုံးတဲ့ command ေတြက git-repo command ေတြပါ https://source.android.com/source/using-repo သုံးမယ့္ Repository ကလည္း git-repo အတြက္ ရည္ရြယ္ၿပီး ေရးထားတဲ့ Repository တခုျဖစ္ပါတယ္ xml နဲ႔ေရးပါတယ္၊ ေရးနည္းက ႐ုိး႐ွင္းပါယ္ ဒီမွာေလ့လာၾကည့္ပါ https://github.com/purezandroid/purezandroid-manifest/blob/purez-8.0.0/default.xml
```bash
repo init -u https://android.googlesource.com/platform/manifest.git -b android-8.1.0_r2
```
 (OR)
```bash
repo init -u https://github.com/zawzaww/aosp-android.git -b android-8.1.0
```
 (OR)
- တျခား CustomROM တခုရဲ႕ SourceCode ပါ Download ဖုိ႔အတြက္ ထပ္ျဖည့္ေျပာပါမယ္။ ( လူသိမ်ားတဲ့ LineageOS နဲ႔ပဲ ဥပမာေပး ေျပာပါမယ္ )
- -b ေနာက္ကေကာင္က branch name ပါ၊ lineage-15.0 က Oreo build အတြက္ပါ၊ cm-14.1/cm-14.0 သုံးရင္ Nougat build အတြက္ပါ၊ ၾကဳိက္တဲ့ Android version ကုိ Build ႏုိင္ပါတယ္။
```bash
repo init -u git://github.com/LineageOS/android.git -b lineage-15.0
```
- Sources ေတြ download ဖုိ႔ ေအာက္က command ေလး ႐ုိက္ေပးပါ။
```bash
repo sync
```
အဲဒီေနာက္မွာေတာ့ Sources ေတြ Downloading လုပ္ေနတဲ့ အပုိင္းပါ၊
SourceCode ေတြ Download တဲ့ process ကေတာ့ Internet connection ေပၚမွာ မူတည္ၿပီးၾကာပါလိမ့္မယ္။

## Building AOSP from Sources
- အရင္ဆုံး Source ကေန Compilation မလုပ္ခင္ ၾကဳိတင္ျပင္ဆင္ရမယ့္ အရာေတြကုိ ေျပာျပေပးပါမယ္။
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

<img src="https://s20.postimg.org/4hn5zcmx9/Screenshot_from_2017-11-03_21-54-22.png" height="100%" width="100%;"/>

- ROM build တဲ့ေနရာမွာ Kernel ပုိင္းက ႏွစ္မ်ဳိးကြဲပါမယ္၊ Kernel source ကေန build တာရယ္ အဆင္သင့္ build ထားၿပီးသား prebuilt kernel ကေန ROM ထဲထည့္ၿပီး Build တာဆုိၿပီး ႐ွိပါတယ္၊ kernel source ကေန build တာပဲ အၾကံေပးတယ္။
- ၿပီးတဲ့ေနာက္ Kernel source ကေန build မယ္ဆုိရင္ Device tree ထဲက ျပင္ဆင္စရာ႐ွိပါတယ္၊ Nexus 5X အေနနဲ႔ ေျပာပါမယ္ /device/lge/bullhead/BoardConfig.mk ကုိ TextEditor တခုနဲ႔ ဖြင့္ၿပီး ေအာက္က code ေလးေတြ ထပ္ျဖည့္လုိက္ပါ။
```bash
# Inline PureZ Kernel Build
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

<img src="https://s20.postimg.org/thf0h4mjh/Screenshot_from_2017-11-03_21-58-30.png" height="100%" width="100%;"/>

- ေနာက္တဆင့္က Kernel source အပုိင္းပါ သြားထည့္ေပးရမယ့္ Location က Source dir ေအာက္က /kernel ေအာက္မွာ သြားထည့္ေပးရမွာပါ။
- Format:
```bash
/kernel/manufacturer/device_name
```
- Example: for Nexus 5X ( ဒီ Location က Device tree ထဲမွာ Kernel source path လမ္းေၾကာင္း ျပန္ေပးရမွာပါ )
```bash
/kernel/lge/bullhead
```

<img src="https://s20.postimg.org/852x5n81p/Screenshot_from_2017-11-03_21-54-57.png" height="100%" width="100%;"/>

- vendor အပုိင္းပါ အဲဒီေကာင္က Source dir ေအာက္က /vendor ေအာက္မွာ သြားထည့္ေပးရမွာပါ။
- Format:
```bash
/vendor/manufacturer/device_name
```
- Example: for Nexus 5X
```bash
/vendor/lge/bullhead
```

<img src="https://s20.postimg.org/yesl2cjel/Screenshot_from_2017-11-03_21-56-37.png" height="100%" width="100%;"/>

ဒါေတြျပည့္စုံသြားရင္ေတာ့ AOSP ROM တခု Build ဖုိ႔ အဆင္သင့္ ျဖစ္ပါၿပီ။

- ဒါကေတာ့ ေနာက္ဆုံးအဆင့္ေရာက္ပါၿပီ၊ Download ထားတဲ့ Source Dir ထဲ ဝင္လုိက္ၿပီး Terminal ကုိ ဖြင့္လုိက္ပါ၊ ေအာက္က command ေလး ႐ုိက္ေပးပါ။
```bash
. build/envsetup.sh
```
ၿပီးသြာရင္ ကုိယ္ build မယ့္ device ကုိ lunch လုပ္ေပးရပါမယ္။
- Format
```bash
lunch <device_name> (OR) lunch
```
Example: for Nexus 5X
```bash
lunch aosp_bullhead-userdebug
```

<img src="https://s20.postimg.org/oy2rvsk59/Screenshot_from_2017-11-04_06-23-10.png" height="100%" width="100%;"/>

- အေကာင္းဆုံးက lunch လုိ႔ ႐ုိက္လုိက္ရင္ ကုိယ္ build မယ့္ device name ေတြ က်လာၿပီး build ခ်င္တဲ့ device no. ကုိ ဆက္႐ုိက္ေပးပါ။
```bash
lunch
```
```bash
Enter 1 or 2 or 3 etc...
```
- ၿပီးရင္ Build ဖုိ႔အတြက္ ေအာက္က command ေလး ႐ုိက္ေပးပါ။
```bash
make -j4
```
 (OR)
```bash
make -j$(nproc --all)
```
```bash
Output - /out/target/product/bullhead/ ေအာက္မွာ ထြက္သြားပါလိမ့္မယ္
```
ၿပီးရင္ေတာ့ Compilation process စတင္ပါမယ္၊ process time ကေတာ့ ကုိယ့္ Computer ရဲ႕ CPU core ေပၚ မူတည္ၿပီးၾကာပါလိမ့္မယ္။


Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)

Copyright (C) 2018, ZawZaw.
