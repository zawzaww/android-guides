<p align="center"> 
  <img src="https://cdn-images-1.medium.com/max/800/1*8n61mSsv8cH32HmWU5G2Bw.png" /> 
</p>

# About the “aosp-android” GitHub Repository
## Android Platform Manifest : My Personal AOSP SourceCode for Building Pure Android

ဒီ Article ကေတာ့ AOSP ဆိုတာ ဘာလဲဆိုတဲ့ အေၾကာင္းအရာအနည္းငယ္နဲ႕ ကြၽန္ေတာ့္ရဲ႕ GitHub က Personal “aosp-android” Repository အေၾကာင္းကို ေရးေပးသြားမွာ ျဖစ္ပါတယ္။

# What is AOSP?
AOSP ဆိုတာ Android Open Source Project ရဲ႕ အတိုေကာက္ စကားလုံး ျဖစ္ပါတယ္။ AOSP မွာ ႏွစ္ပိုင္းခြဲၾကည့္လို႔ရမယ္ ပထမတခုက Android OS/System ပိုင္းနဲ႕ ပတ္သက္ၿပီး Documentation ေတြ ဖက္လု႔ိရမယ့္ (source.android.com) နဲ႕ Android OS တခုလုံးအတြက္ SourceCode Git Repositories ေတြရွိတဲ့ AOSP Google Git (https://android.googlesource.com) တို႔ ျဖစ္တယ္။ အဲဒီ AOSP Google Git မွာ Android OS ပတ္သက္တဲ့ “system package apps / framework support / framework native / bionic / bootable recovery / art and dalvik VM, android build system and etc.. စတဲ့ Git Repositories ေတြ အားလုံး Open Source အေနနဲ႕ ရယူနိုင္ပါတယ္။ တခုသိရမွာက Google ရဲ႕ ကိုယ္ပိုင္ Android apps ေတြေတာ့ AOSP ထဲမွာ မပါဝင္ဘူး (e.g : Gapps) သူတု႔ိေတြက Open Source မဟုတ္ပါဘူး။ ကိုယ့္ရဲ႕ Android ဖုန္းအတြက္ Custom OS build မယ္ဆိုရင္ Android OS SourceCode ေတြကို AOSP Google Git က ကရယူရမွာ ျဖစ္ပါတယ္။

# GitHub Repository: aosp-android
## https://github.com/zawzaww/aosp-android

# About
ဒီ GitHub က Personal [“aosp-android”](https://github.com/zawzaww/aosp-android) Repository က Android Devices ေတြအတြက္ Android Custom OS build ဖု႔ိရန္ SourceCode ေတြ Size နည္းနည္းနဲ႕ download ဆြဲလု႔ိရေအာင္ Setup လုပ္ထားတာ ျဖစ္ပါတယ္။ Personal ဆိုေပမယ့္ တျခားလိုအပ္သူေတြလည္း သုံးနိုင္ပါတယ္။

# Description
ဒီ Personal [“aosp-android”](https://github.com/zawzaww/aosp-android) GitHub Repository နဲ႕ မူရင္း AOSP Google Git က [“platform-minifest”](https://android.googlesource.com/platform/manifest) Repository နဲ႕ ကြာျခားခ်က္ေတြရွိပါတယ္။ ဒီ Repository ေတြကို Android Platform Manifest လု႔ိလည္း ေခၚပါတယ္။ Android OS SourceCode ေတြ Download လုပ္ဖု႔ိ XML file တခုနဲ႕ Setup လုပ္ၿပီး Google ရဲ႕ git-repo Tool ကိုသုံးၿပီး တခါတည္း တေနရာတည္း SourceCode Repos ေတြ အမ်ားႀကီးကို Download လုပ္နိုင္ပါတယ္။ သေဘာက OS တခု Build ဖု႔ိ Repos ေတြက အမ်ားႀကီးျဖစ္တဲ့အတြက္ အဲဒီ XML file က ကိုယ္ download လုပ္ခ်င္တဲ့ Remote Repos ေတြအားလုံး စုေပးထားၿပီး Google ရဲ႕ git-repo Tool အကူအညီနဲ႕ တခါတည္း download လုပ္နိုင္တဲ့ Command Line access ေတြ ရပါတယ္။ Google ရဲ႕ git-repo အေၾကာင္းကို ဒီမွာ ဖက္နိုင္ပါတယ္။ အေပၚမွာေျပာတဲ့ ကြာျခားခ်က္ဆိုတာ OS SourceCode ရဲ႕ File size ကို ဆိုလိုတာ ျဖစ္ပါတယ္။ မူရင္း AOSP SourceCode filesize အနည္းဆုံး 50GB ေက်ာ္ ရွိပါတယ္ ဘာေၾကာင့္လဲဆိုေတာ့ မူရင္းက လိုတာေတြေရာ မလိုအပ္တဲ့ Git Repository အမ်ားႀကီး ထည့္ထားတဲ့အတြက္ေၾကာင့္ Filesize မ်ားေနပါတယ္။ အဲဒါကို ကြၽန္ေတာ့္ရဲ႕ GitHub Repository မွာေတာ့ မလိုအပ္တဲ့ “system packages/apps, kernel prebuilts and device trees” စတဲ့ မလိုအပ္တဲ့ Repository အားလုံးကို Remove လုပ္ထားတဲ့ အတြက္ Filesize က သိသိသာသာႀကီးကို က်သြားပါတယ္ အလြန္ဆုံး 25GB ေလာက္မွ ရွိပါတယ္။ ကြာျခားခ်က္ဆိုတာ အဲဒါကိုေျပာတာပါ။ အဲဒီထက္ေတာ့ ေလ်ာ့လု႔ိမရေတာ့ပါဘူး အဲဒါက Custom OS တခု Build ဖု႔ိအတြက္ အနည္းဆုံးျဖစ္ပါတယ္။

# How To Download the Android OS SourceCode
ပထမဆုံးအေနနဲ႔ SourceCode ေတြ Download လုပ္ဖို႔ Git and Repo ကို Setup လုပ္ထားဖို႔ လိုအပ္ပါတယ္

If you want to Automatic Setup environment, run this script [envsetup.sh](https://github.com/zawzaww/aosp-android/blob/android-8.1.0/envsetup/envsetup.sh)

အရင္ဆုံး ကိုယ္ Build ခ်င္တဲ့ Android OS version ကို Local ထဲမွာ “repo init” လုပ္ေပးဖို႔ လိုပါတယ္ (-b ေနာက္က Name က branch name ပါ တနည္းအားျဖင့္ ကိုယ္ Build ခ်င္တဲ့ Android OS version ပါ)

```bash
repo init -u https://github.com/zawzaww/aosp-android.git -b android-8.1.0
```

(OR)

To initialize a shallow clone, which will save even more space, use a command like this (ဒီ command က filesize သက္သက္သာသာနဲ႔ download လုပ္ႏိုင္ဖို႔ ကူညီပါတယ္)

```bash
repo init --depth=1 -u https://github.com/zawzaww/aosp-android.git -b android-8.1.0
```

Sources ေတြ Download လုပ္ဖို႔ ဒီ command ကို ႐ိုက္ေပးပါ

```bash
repo sync
```

(OR)

Additionally, you can define the number of parallel download repo should do (ဒီ command က SourceCode Repositories ေတြကို ျမန္ျမန္ဆန္ဆန္ Download လုပ္ႏိုင္ဖို႔ ကူညီပါတယ္)

```bash
repo sync  -f --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
```

# How To Build Pure Android for your Android Device
Sources ေတြ အားလုံး Download လုပ္ၿပီးသြားရင္ Custom Android OS တခု Compile ဖို႔ ဒီ command ေတြ ဆက္႐ိုက္ေပးပါ

```bash
cd <source-dir>
. build/envsetup.sh
lunch <device_name>
make -j4 (OR) make -j$(nproc --all)
```

ကိုယ့္ရဲ႕ Android Device အတြက္ Custom Android OS version တခု ဘယ္လို Build မလဲဆိုတဲ့ အေသးစိတ္ကို [“Building Custom Android OS”](https://medium.com/zawzaww/how-to-build-custom-android-os-for-android-devices-cf4bba4bb3a5) How-To Article မွာ ဆက္လက္ ဖက္ႏိုင္ပါတယ္။


Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)

