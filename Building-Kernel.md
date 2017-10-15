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
- OnePlus : https://github.com/OnePlusOSS
- Motorola : https://github.com/MotorolaMobilityLLC


# Toolchains
Kernel Source ကေန compile ဖုိ႔အတြက္ဆုိရင္ Toolchain တခုလုိအပ္ပါတယ္၊ Toolchain မွာ ကုိယ့္ဖုန္ ရဲ႕ CPU arch ေပၚ မူတည္ၿပီ ARM နဲ႔ ARM64 ဆုိၿပီး ၂မ်ဳိး ႐ွိပါတယ္။ လုိအပ္တဲ့ Link ေတြ ေအာက္မွာ ေပးထားပါတယ္။
- arm : https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/
- arm64 : https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/

