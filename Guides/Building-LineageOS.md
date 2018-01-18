<center><img src="https://www1-lw.xda-cdn.com/files/2017/03/LineageOS-810x298_c.png" height="100%" width="100%;"/></center>

# How To Build LineageOS for Andorid Devices

# Introduction
   ဒီတခါေတာ့ ကြၽန္ေတာ္ေျပာျပမယ့္အေၾကာင္းအရာကေတာ့ LineageOS SourceCode ကေန ကုိယ့္ရဲ႕ Android Device အတြက္ LineageOS CustomROM တခု ဘယ္လုိ Build မလဲဆုိတဲ့ အေၾကာင္းအရာပါ။ LineageOS ဆုိတာ Android CustomROM Cummunity ေတြထဲမွာ Support Device အမ်ားဆုံး Popular အျဖစ္ဆုံးနဲ႔ အႀကီးဆုံးလု႔ိ ေျပာလု႔ိ ရပါတယ္၊ Android User ေတာ္ေတာ္မ်ားမ်ားလည္း ရင္းႏွီးၾကပါတယ္။ အခုေျပာမယ့္ နည္းကုိသိသြားရင္ တျခားေသာ Android CustomROM အမ်ားအျပားပါ build တတ္သြားပါလိမ့္မယ္။ တခုပဲကြဲျပားသြားပါလိမ့္မယ္ Android OS SourceCode ယူရတဲ့ ေနရာပဲကြဲသြားတာပါ။(Example: Android CustomROM Teams - OmniROM, AOSiP, AOKP, AOSP Extended, Dirty Unicorns, ResurrectionRemix and etc...) တခုေတာ့ သတိေပးထားပါရေစ Android OS SourceCode ရဲ႕ filesize က 20GB နဲ႔ အထက္မွာ ႐ွိပါတယ္။ အဲဒါေၾကာင့္ Internet ေကာင္းမွပဲ အဆင္ေျပပါလိမ့္မယ္။ Build တဲ့ ေနရာမွာ Linux မွာေရာ Mac မွာေရာ build လုိ႔ရပါတယ္ ကြၽန္ေတာ္ကေတာ့ Linux နဲ႔ပဲ target ထားၿပီးေျပာသြားမွာျဖစ္ၿပီး၊ ခုေလာေလာဆယ္ေတာ့ ubuntu 17.04 ပဲ သုံးျဖစ္ပါတယ္၊ အဲဒါေၾကာင့္ ubuntu ေပၚမွာ build တာပဲ ဥပမာေပး ေျပာသြားမွာပါ၊ Build မယ့္ target Android Device က Nexus 5X / 6 နဲ႔ ဥပမာေပးၿပီး ေျပာျပသြားမွာ ျဖစ္ပါတယ္။

# Requirements
- Linux OS သုံးထားတဲ့ Computer တလုံး႐ွိရပါမယ္
- OpenJDK Install ထားရပါမယ္
- Python 2.7+ Install ထားရပါမယ္ (ဘာလုိ႔လဲဆုိေတာ့ Google ရဲ့ git-repo က Python နဲ႔ေရးထားတာ ျဖစ္ပါတယ္၊ အဲဒါေၾကာင့္ Python Install လုပ္မထားရင္ git-repo က အလုပ္မလုပ္ပါဘူး)
- Git အသုံးျပဳတတ္ရပါမယ္
- Google ရဲ႕ git-repo လည္း သုံးတတ္ရပါမယ္။ git-repo အေၾကာင္းကုိ ဒီမွာဝင္ဖက္ႏုိင္ပါတယ္... https://code.google.com/archive/p/git-repo/ ၿပီးသြားရင္ git-repo command ေတြကုိ ဒီမွာ ေလ့လာၾကည့္ပါ... https://source.android.com/source/using-repo 
(git-repo ဆုိတာ Git ေပၚမွာ အေျခခံၿပီး Google က develop ထားတဲ့ tool တခုပါ၊ Android ROM Development မွာ အရမ္းအသုံးဝင္ပါတယ္၊ [ git-repo - Multiple Repository Tool ] လုိ႔ေခၚပါတယ္၊ သူ႔ရဲ႕ အသုံးဝင္ပုံက Repo တခုေဆာက္ၿပီး အဲဒီထဲမွာ xml file ေလးတခုေဆာက္ၿပီး ကုိယ္လုိခ်င္တဲ့ ကုိယ္ remote လုပ္ခ်င္တဲ့ repo ေတြကုိအမ်ာႀကီးကုိ link ေပးၿပီး repo sync ဆုိတဲ့ command ကုိသုံးၿပီး ကုိယ့္ရဲ႕ Local machine ထဲကုိ တေနရာတည္းမွာပဲ Repository ေတြအမ်ာႀကီးကုိ download ဆြဲလုိ႔ရပါတယ္၊ သေဘာက ROM တခု build ဖုိ႔ လုိအပ္တဲ့ Android SourceCode Repository ေတြက အမ်ားႀကီးပါ အဲဒါကုိ တခုခ်င္းလုိက္ git clone မေနပဲ xml file ေလးကေန Repository အမ်ားႀကီးစုၿပီး Local ထဲကုိ download ဆြဲလုိက္တဲ့ သေဘာပါပဲ)

