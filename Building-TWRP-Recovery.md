<img src="https://img.xda-cdn.com/XXEijIJ9sFe_-u4VZQgkjZkKwcU=/http%3A%2F%2Fwww.aftvnews.com%2Fwp-content%2Fuploads%2F2016%2F02%2Fteamwin-recovery-project-twrp-logo.jpg" height="100%" width="100%;" />

# How To Build a CustomRecovery (TWRP) for Android Devices

# Team Win Recovery Project (TWRP)

## Introduction
   ဒီတခါ ကြၽန္ေတာ္ေရးမယ့္ အေၾကာင္းအရာကေတာ့ SourceCode ကေန Android Devices ေတြအတြက္ Custom Recovery တခု Build နည္းကုိ ေျပာျပေပးမွာျဖစ္ပါတယ္။ ဒီေနရာမွာ ႐ွင္းျပစရာေတြ႐ွိပါတယ္ Android မွာ Recovery ပုိင္းမွာ ႏွစ္မ်ဳိး႐ွိပါယ္။ Stock Recovery နဲ႔ Custom Recovery ဆုိၿပီး ႐ွိပါတယ္။ 
Stock Recovery က ဖုန္းဝယ္ကတည္းက built-in ပါလာတဲ့ Recovery တခုျဖစ္ပါတယ္၊ ပုံမွန္အားျဖင့္ ဘာေတြလုပ္လုိ႔ရလည္းဆုိေတာ့ အဲဒီ Stock Recovery Mode ကေန ဖုန္းရဲ႕ Data ေတြကုိ Factory Reset ခ်ႏုိင္တယ္၊ Wipe cache နဲ႔ Wipe davilk cache လုပ္ႏုိင္မယ္၊ Firmware Official Update Zip ေတြနဲ႔ Update လုပ္ႏုိင္တယ္။ (ဥပမာ OnePlus ဖုန္းေတြ သုံးဖူးရင္ သိပါတယ္ အဲဒီ Stock Recovery ကေန Firmware Update ေတြ လုပ္သြားလု႔ိရပါတယ္ )။
Custom Recovery ဆုိတဲ့ ေခါင္းစဥ္ေအာက္မွာ ထပ္ခြဲလုိ႔ ရပါေသးတယ္။ CWM Recovery / PhilZ Touch Recovery / TWRP Revovery ဆုိၿပီး ႐ွိပါတယ္၊ PhilZ Touch က တကယ္က CWM Advanced Edition တခုပါပဲ။ ကြၽန္ေတာ္ အဓိကေျပာမွာ Features အၾကမ္းေတြနဲ႔ လူအမ်ားသိတဲ့ TWRP (Team Win Recovery Project) အေၾကာင္းပါပဲ။ TWRP ရဲ႕ ပုံမွန္ features ေတြက FlashableZip ေတြ Install လုပ္ႏုိင္မယ္ အဲဒီထဲမွာ Custom ROM ေတြ Kernel ေတြ Install လုပ္တာေတြ Root လုပ္တဲ့အပုိင္းေတြ အကုန္ပါပါတယ္၊ /data  /boot  /system  /recovery partition ေတြ အကုန္ Backup and Restore လုပ္ႏုိင္မယ္(တနည္းအားျဖင့္ Firmware ႀကီးတခုလုံး  Backup/Restore လုပ္ႏုိင္မယ္)၊ /data  /cache  /system ေတြ Wipe လု႔ိရမယ္ အဲဒီအထဲ Factory Reset ခ်တာေတြ Format Data လုပ္တာေတြ အကုန္ပါပါတယ္ ၊ ေနာက္ mount/unmount လုပ္ခြင့္႐ွိမယ္၊ TWRP Recovery Mode ရဲ႔ file manager ကေန /system ထဲ access (read/write) လုပ္ခြင့္႐ွိမယ္၊ ေနာက္ထပ္ features ေတြ အမ်ားႀကီး ႐ွိပါေသးတယ္ မေျပာေတာ့ပါဘူး ဒီေလာက္ဆုိ လုံေလာက္မယ္ ထင္ပါတယ္။

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
- ပထမဆုံး ကုိယ္ Build မယ့္ Android Device ရဲ႕ Device tree နဲ႔ Kernel source လုိပါတယ္၊ Device tree နဲ႔ Kernel Source သြားထည့္ေပးရမယ့္ Location ကေတာ့ ROM Building Tutorial ထဲကတုိင္း တူတူပါပဲ၊ ထပ္ေျပာေပးပါမယ္ယ
- Format: Device tree
```bash
device/manufacturer/device_name
```
- Example: for Nexus 6
```bash
device/moto/shamu
```
- Format: Kernel Source
```bash
kernel/manufacturer/device_name (or) chipset_name for any android devices
```
- Example: for Nexus 6
```bash
kernel/moto/shamu
```
