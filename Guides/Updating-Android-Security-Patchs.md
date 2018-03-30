# How To Update Android Security Patchs for Google Nexus and Pixel Devices

## Introduction
   ဒီတခါေရးမယ့္ အေၾကာင္းအရာကေတာ့ Google ရဲ႕ Android Device ေတြျဖစ္တဲ့ Nexus နဲ႔ Pixel Device မ်ားအတြက္ လစဥ္ Google ကေပးတဲ့ Android Security Patch ေတြကုိ ဘယ္လုိ Update လုပ္မလဲဆုိတဲ့ အေၾကာင္းအရာပါ၊ Kernel အပုိင္းအတြက္ျဖစ္ပါတယ္။ အဲဒီ လစဥ္ေပးတဲ့အထဲမွာ အဓိကအားျဖင့္ bugs fix & Security update ေတြ အဓိကပါဝင္ပါတယ္။ Tutorial အေသးေလးတခုပါပဲ။ အရင္တခါတုန္းက ေရးခဲ့တဲ့ Upstream linux kernel update လုပ္တာနဲ႔ သေဘာတရားတူတူပါပဲ။
   
## Requirements
- Git
- Basic git commands
- Linux Computer

# How To Update
- သေဘာတရားကုိ အရင္႐ွင္းျပေပးပါမယ္၊ ဥပမာ - ကုိယ့္မွာ Nexus 5X အတြက္ Build မယ့္ Kernel source တခု႐ွိတယ္ထားပါေတာ့၊ အဲဒီကုိယ့္ရဲ႕ Keenel Repo ထဲကုိ အခုေနာက္ဆုံးထြက္ထားတဲ့ November Android Security Patch Code မ်ားကုိ Merge ၿပီးရင္ ပုံမွန္အတုိင္း ျပန္ၿပီး Kernel Compile လုပ္မွာျဖစ္ပါတယ္။ ( ၾကဳိေျပာထားပါမယ္ အခု Code ေတြက Kernel ပုိင္းအတြက္ ျဖစ္ပါတယ္ )
- ပထမဦးဆုံး ကုိယ့္ဖုန္းအတြက္ အဆင္သင့္ Kernel source တခု႐ွိဖုိ႔လုိပါတယ္။ အဲဒီအထဲကုိ Security Update Code ေတြ Merge မွာျဖစ္ပါတယ္။ Nexus 5X နဲ႔ ဥပမာေပး ေျပာျပမွာ ျဖစ္ပါတယ္။
- ၿပီးတဲ့ေနာက္ Google Nexus နဲ႔ Pixel Device ေတြအတြက္ Kernel Repo ေတြ ႐ွိတဲ့ေနရာကုိ သိရပါမယ္ (Qualcomm chipset only Devices) https://android.googlesource.com/kernel/msm

<img src="https://s20.postimg.org/4auhrh17h/Screenshot_from_2017-11-10_22-12-45.png" height="100%" width="100%;"/>

- အရင္ ကုိယ့္ရဲ႕ Local Kernel Source Repo ထဲ ဝင္ၿပီး Terminal ကုိ ဖြင့္လုိက္ပါ။
- ေအာက္က command ေလး႐ုိက္ေပးပါ။ ( git fetch ၿပီး tag အလုိက္ merge မွာ ျဖစ္ပါတယ္ )
- Format:
```bash
git fetch --tags <repo_url> <branch_name>
```
- Example: for Nexus 5X ( branch name ကုိ Google ေနာက္ဆုံး release ထားတဲ့ branch ပဲေရြးေပးပါ၊ ခုေလာေလာဆယ္က bullhead-3.10-oreo-r6 ျဖစ္ပါတယ္ )
```bash
git fetch --tags https://android.googlesource.com/kernel/msm/ android-msm-bullhead-3.10-oreo-r6
```

<img src="https://s20.postimg.org/tgvfy6cql/Screenshot_from_2017-11-10_22-12-30.png" height="100%" width="100%;"/>

- ၿပီးရင္ ဒီ Link...https://android.googlesource.com/kernel/msm/+/android-msm-bullhead-3.10-oreo-r6 မွာဝင္ၿပီး log ဆုိတာေတြ႔ရမွာ ျဖစ္ပါတယ္၊ အဲဒီ log ေလးကုိႏွိတ္လုိက္ပါ၊ အေပၚဆုံး commit ကုိ ၾကည့္လုိက္ရင္ အစိမ္းေရာင္ tag ေလးတခု ေတြ႔ရပါလိမ့္မယ္၊ အခု ႏုိဝင္ဘာလအတြက္ android-8.0.0_r25 ဆုိတာ႐ွိပါတယ္။ ( အဲဒီ tag name ေလးမွတ္ထားပါ git merge တဲ့ေနရာမွာ ျပန္သုံးမွာပါ )

<img src="https://s20.postimg.org/e9fgdlv3x/Screenshot_from_2017-11-10_22-13-09.png" height="100%" width="100%;"/>
<img src="https://s20.postimg.org/6uq4l3r71/Screenshot_from_2017-11-10_22-13-22.png" height="100%" width="100%;"/>
<img src="https://s20.postimg.org/o80f029od/Screenshot_from_2017-11-10_22-13-44.png" height="100%" width="100%;"/>

- ၿပီးတဲ့ေနာက္ fetch ၿပီးသြားရင္ Terminal မွာ ေအာက္က command ေလး႐ုိက္ေပးပါ။
- Format
```bash
git merge <tag_name>
```
- Example: for Nexus 5X
```bash
git merge android-8.0.0_r0.25
```
- ဥပမာ အေနနဲ႔ ကြၽန္ေတာ္ merge ထားတဲ့ commit တခုကုိ ျပထားေပးပါမယ္၊ ၾကည့္ၾကည့္ပါ။ ( Merge android-8.0.0_r25  https://github.com/purezandroid/purez-kernel-bullhead/commit/c20be4d476135e98b67753d7d766d0c4b6de2ba8 )
- အဲဒီေနာက္မွာေတာ့ Code ေတြကုိ Auto merging လုပ္သြားပါလိမ့္မယ္။
- တကယ္လုိ႔ Conflicts ျဖစ္သြားရင္ Terminal မွာ file location နဲ႔အတူ message ျပေပးပါလိမ့္မယ္။
- ေနာက္ဆုံးအဆင့္ကေတာ့ Code ေတြ merge ၿပီးရင္ ပုံမွန္အတုိင္း Kernel Compilation လုပ္လုိ႔ရပါၿပီ။
- DONE

Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)


Copyright (C) 2017-2018, Zaw Zaw.
