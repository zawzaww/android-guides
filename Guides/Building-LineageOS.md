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

