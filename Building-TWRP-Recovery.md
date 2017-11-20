# How To Build a CustomRecovery (TWRP) for Android Devices

# Team Win Recovery Project (TWRP)

## Introduction
   ဒီတခါ ကြၽန္ေတာ္ေရးမယ့္ အေၾကာင္းအရာကေတာ့ SourceCode ကေန Android Devices ေတြအတြက္ Custom Recovery တခု Build နည္းကုိ ေျပာျပေပးမွာျဖစ္ပါတယ္။ ဒီေနရာမွာ ႐ွင္းျပစရာေတြ႐ွိပါတယ္ Android မွာ Recovery ပုိင္းမွာ ႏွစ္မ်ဳိး႐ွိပါယ္။ Stock Recovery နဲ႔ Custom Recovery ဆုိၿပီး ႐ွိပါတယ္။ 
Stock Recovery က ဖုန္းဝယ္ကတည္းက built-in ပါလာတဲ့ Recovery တခုျဖစ္ပါတယ္၊ ပုံမွန္အားျဖင့္ ဘာေတြလုပ္လုိ႔ရလည္းဆုိေတာ့ အဲဒီ Stock Recovery Mode ကေန ဖုန္းရဲ႕ Data ေတြကုိ Factory Reset ခ်ႏုိင္တယ္၊ Wipe cache နဲ႔ Wipe davilk cache လုပ္ႏုိင္မယ္၊ Firmware Official Update Zip ေတြနဲ႔ Update လုပ္ႏုိင္တယ္။ (ဥပမာ OnePlus ဖုန္းေတြ သုံးဖူးရင္ သိပါတယ္ အဲဒီ Stock Recovery ကေန Firmware Update ေတြ လုပ္သြားတာပါ )။
Custom Recovery ပုိင္းမွာေတာ့ ထပ္ၿပီးအမ်ဳိးအစားေတြ ခြဲသြားပါမယ္။ CWM Recovery / PhilZ Touch Recovery / TWRP Revovery ဆုိၿပီး ႐ွိပါတယ္၊ PhilZ Touch က တကယ္က CWM Advanced Edition တခုပါပဲ။ ကြၽန္ေတာ္ အဓိကေျပာမွာ Features အၾကမ္းေတြနဲ႔ လူအမ်ားသိတဲ့ TWRP (Team Win Recovery Project) အေၾကာင္းပါပဲ။ TWRP ရဲ႕ features ေတြက FlashableZip ေတြ Install လုပ္ႏုိင္မယ္ အဲဒီထဲမွာ Custom ROM ေတြ Kernel ေတြ Install လုပ္တာေတြ Root လုပ္တဲ့အပုိင္းေတြ အကုန္ပါပါတယ္၊ /data /boot/system /recovery partition ေတြ အကုန္ Backup and Restore လုပ္ႏုိင္မယ္၊ /data /cache /system ေတြ Wipe လု႔ိရမယ္ အဲဒီအထဲ Factory Reset ခ်တာေတြ Format Datat လုပ္တာေတြ အကုန္ပါပါတယ္ ၊ TWRP Recovery Mode ရဲ႔ file manager ကေန /system ထဲ access လုပ္ခြင့္႐ွိတယ္၊ ေနာက္ထပ္ features ေတြ အမ်ားႀကီး ႐ွိပါေသးတယ္ မေျပာေတာ့ပါဘူး ဒီေလာက္ဆုိ လုံေလာက္မယ္ ထင္ပါတယ္။

