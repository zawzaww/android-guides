<img src="https://s20.postimg.cc/wr7f8z1nh/Screenshot_from_2018-05-15_07-12-46.png" height="100%" width="100%;" />

# Gin Android OEMs (Android Phone Manufacturers)

ျပီးခဲ့တဲ့ 2018 April လ ေလာက္မွာ ႏုိင္ငံျခား Tech site ေတာ္ေတာ္မ်ားမ်ားမွာ သတင္းတခုထြက္ခဲ့တယ္။ သတင္းက Android ဖုန္း ထုတ္လုပ္သူ Company တခ်ဳ႔ိ Android Security Patch Level ကုိ Users ေတြကုိ လိမ္ခဲ့တယ္ ဆုိတဲ့ကိစၥပါ။ ဘယ္လုိသိခဲ့တာလဲဆုိရင္ တကယ္ေတာ္တဲ့ Security Researcher ေတြ ႐ွာေတြ႔ခဲလု႔ိ Report တင္ခဲ့တဲ့အတြက္ေၾကာင့္ပါ။

ဘယ္လုိလိမ္ခဲ့တာလဲဆုိရင္ သင္ဆုိင္ရာ Android Security Patches တကယ္တမ္း Merge/Install လုပ္ခဲ့မဟုတ္ပဲ အလြယ္နားလည္ေအာင္ေျပာရရင္ Settings>About Phone ထဲ Android Security Patch Level ဆုိတဲ့ေနရာက Date ေလးပဲ Change လုိက္တဲ့ သေဘာပါ။

Users ေတြကုိ ဘယ္လုိ လိမ္လု႔ိရလဲဆုိရင္ Technically ေသခ်ာေျပာရရင္ Android OS ရဲ႕ SourceCode Repositories ေတြအကုန္႐ွိတဲ့ေနရာ AOSP Google Git (https://android.googlesource.com) ေအာက္က platform/build ဆုိတဲ့ Git Repository တခု႐ွိပါတယ္။ အတိအက် ေပးရရင္ https://android.googlesource.com/platform/build ျဖစ္ပါတယ္။ သေဘာတရား အၾကမ္းေျပာျပရရင္ အဲဒီ Repository က ဘာအတြက္လဲဆုိရင္ Android Build System အတြက္ပါ။ ဆုိလုိတာက Android OS ႀကီး တခုလုံးရဲ႕ သက္ဆုိင္ရာ လုိအပ္တဲ့ SourceCode Repositories ေတြကေန “System.img” ထြက္လာထိ Compile လုပ္ဖု႔ိ Build လုပ္ဖု႔ိ အတြက္ အဓိကရည္ရြယ္ထားတဲ့ make command ေတြနဲ႔ Build automation လုပ္ႏုိင္ဖု႔ိအတြက္ Makefile နဲ႔ ေရးထားတာတဲ့ Repositoryတခုျဖစ္ပါတယ္။

About the “Make” and “Makefile”

Source: Wikipedia
```bash
In software development, Make is a build automation tool 
that automatically builds executable programs 
and libraries from source code by reading files called Makefiles 
which specify how to derive the target program.

A Makefile is a file (by default named “Makefile”) 
containing a set of directives used by a make build automation tool 
to generate a target/goal.
```
အဲဒီ (https://android.googlesource.com/platform/build.git) Repository ထဲက core/ေအာက္က version_defaults.mk ဆုိတဲ့ file ေလးကုိ ဖြင့္ၾကည့္လုိက္ရင္
```bash
#
# Handle various build version information.
#
# Guarantees that the following are defined:
#
# PLATFORM_VERSION
# PLATFORM_SDK_VERSION
# PLATFORM_VERSION_CODENAME
# DEFAULT_APP_TARGET_SDK
# BUILD_ID
# BUILD_NUMBER
# PLATFORM_SECURITY_PATCH
# PLATFORM_VNDK_VERSION
# PLATFORM_SYSTEMSDK_VERSIONS
#
```
အစ႐ွိသျဖင့္ အကုန္ Define လုပ္ေပးလု႔ိ ရပါတယ္။ April လ တုန္းက သတင္းမွာ Android OEM Company တခ်ဳိ႔ Android Security Patch Level လိမ္ခဲ့တယ္ဆုိတဲ့ အဓိပၸါယ္က သက္ဆုိင္ရာ Android Security flaw ေတြကုိ Fix လုပ္ထားတဲ့ Security patches / Code ေတြကို Merge ခဲ့တာ မဟုတ္ပဲ "Date" ေလးပဲ Change ႐ုံသက္သက္ပဲ လုပ္ခဲ့ၿပီး User ေတြဆီ Software update ျပန္ေပးခဲ့တဲ့ဆုိတဲ့ သေဘာျဖစ္ပါတယ္။

အခု Screenshot မွာ ျပထားတဲ့အတုိင္း platform/build Repository ထဲက core/version_defaults.mk file ထဲက Line No.184 မွာရွိတဲ့ “PLATFORM_SECURITY_PATCH := Year-Month-Day” ဆုိတဲ့ line မွာ Date ေလးပဲ ျပင္ၿပီး Recompile ျပန္လုပ္လုိက္ရင္ ဒါက ရပါၿပီ။ Company ႀကီးေတြလုပ္ၿပီး ဒါဟာ သိပ္ၿပီး ကေလးဆန္တဲ့ အလုပ္ပါ။ လုံးဝကုိ မလုပ္သင့္ပါဘူး။

***(Root ထားတဲ့ Android phone ဆုိရင္ /system/build.prop မွာ Android Security Patch Date ခ်ိန္းၿပီး Phone ကို Reboot ခ်လုိက္ရင္ေတာင္ ဒါေတြက ရေနတဲ့ကိစၥပါ)

CODE: Example
```bash
ifndef PLATFORM_SECURITY_PATCH
# Comment lines
PLATFORM_SECURITY_PATCH := 2018–05–05
endif
```
<img src="https://s20.postimg.cc/wr7f8z1nh/Screenshot_from_2018-05-15_07-12-46.png" />

ပုံမွန္လုပ္ရမွာက AOSP က Android platform fixes ေတြ Upstream Linux Kernel fixes ေတြ Hardware Manufacturer ဘက္က System-On-Chip (SOC) နဲ႔ သက္ဆုိင္တဲ့ SOC fixes ေတြကုိ Merge လုပ္ၿပီးမွ Android Build System က Date ကုိ သြားခ်ိန္းေပးရမွာ ျဖစ္ပါတယ္။ ၿပီးမွ Android System / OS တခုလုံးကုိ "system.img" ထြက္လာတဲ့အထိ Compile ျပန္လုပ္ေပးရမွာ ျဖစ္ပါတယ္။ Android Security Updates ပုိင္း အေသးစိတ္ကုိ ဒီမွာ ေလ့လာႏုိင္ပါတယ္။

Links:
- https://source.android.com/security
- https://source.android.com/security/bulletin

ဒီကိစၥက တကယ္ျဖစ္ခဲ့တာပါ ေအာက္က Ref link ကုိႏွိတ္ၿပီးလည္း ဖက္ၾကည့္ႏုိင္ပါတယ္။ ဒါေၾကာင့္လည္း Android ဟာ ဒီလုိ ဖုန္းထုတ္တဲ့ ဂ်င္း Company ေတြေၾကာင့္ Security ပုိင္းမွာ လုံးဝ အားနည္းခ်က္ေတြ ျပည့္ေနတာ စိတ္မခ်ရတာ မဆန္းပါဘူး။ ဒါ စီးပြားေရးလုပ္ေနတဲ့ Company ႀကီးေတြ အေနနဲ႔ လုံးဝ မလုပ္သင့္တဲ့ ကိစၥပါ၊ ကေလးကစားစရာ အလုပ္မဟုတ္ပါဘူး။ အမွန္တုိင္းေျပာရရင္ တကမၻာလုံးမွာ Google ရဲ့ ကုိယ္ပုိင္ Android device ေတြျဖစ္တဲ့ "Nexus/Pixel" သုံးတဲ့သူက ဘယ္ေလာက္မွ မ႐ွိပါဘူး။ Popular ျဖစ္တဲ့ တျခား Android OEMs ေတြက Phone ေတြ သုံးတဲ့သူ ပုိမ်ားပါတယ္။ အဲဒီ Company ေတြကလည္း ဂ်င္းထည့္ခ်င္ေတာ့ Security updates ေတြက သိပ္ၿပီး ယုံခ်င္စရာ မေကာင္းပါဘူး။ Android နဲ႔ iOS နဲ႔ကြာသြားတာ အဲဒီေနရာမွာပဲလု႔ိထင္တယ္ Android မွာ ထိန္းမႏုိင္သိမ္းမႏုိင္ Android ဖုန္း ထုတ္လုပ္သူေတြမ်ားျပီး၊ အဲဒီ OEM ေတြရဲ႕ဖုန္းေတြရဲ႕ Android Operating System က Customization ေတြ အေသလုပ္ၿပီး Bugs fix and Security Updates/Software Updates လည္း လစဥ္ပုံမွန္ အခ်ိန္မွီ မေပးႏုိင္တဲ့ အျဖစ္ေတြပါ။ ဒီၾကားထဲမွာ အခုလုိမ်ဳိး လုပ္ရပ္ေတြလုပ္ၿပီး မသိနားမလည္တဲ့ Users ေတြကုိ ဂ်င္းထည့္ခ်င္ေနေတာ့ ေတာ္ေတာ္ကုိလြန္ပါတယ္။ ႐ွက္ဖု႔ိလည္း ေကာင္းပါတယ္။ ဒီလုိမ်ဳိး လုပ္ရပ္မ်ဳိးက ေတာ္႐ုံတန္႐ုံ User ကလည္း သိမွာ မဟုတ္ဘူး Software update ေပးေနၿပီဟ ဆုိၿပီး Install လုပ္လုိက္မွာပဲ က်န္တာေတြ စဥ္းစားမွာ မဟုတ္ပါဘူး Researcher ေတြလုိ လုိက္ၿပီး အတြင္းက်က် လိုက္‌ေလ့လာေနမွာ မဟုတ္ပါဘူး လိမ္ရင္ ခံရမယ့္ ကိစၥမ်ဳိးပါ။ ပုိက္ဆံသာ လုိခ်င္ၿပီး ေစတနာ မပါတဲ့ ဂ်င္း Android OEM မ်ားလု႔ိ ေခၚလု႔ိရၿပီ သတ္မွတ္လု႔ိရၿပီ။

Ref: https://www.xda-developers.com/android-oem-lying-security-patches

If you are experienced in some programming language, you can learn here:
- https://android.googlesource.com/platform/build
- https://github.com/zawzaww/android-build


Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)
