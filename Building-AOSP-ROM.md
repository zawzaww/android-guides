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
repo init -u https://android.googlesource.com/platform/manifest -b android-8.0.0_r23
```
(OR)
```bash
repo init -u https://github.com/zawzaww/aosp-android -b oreo
```
- Sources ေတြ download ဖုိ႔ ေအာက္က command ေလး ႐ုိက္ေပးပါ။
```bash
repo sync
```
အဲဒီေနာက္မွာေတာ့ Sources ေတြ Downloading လုပ္ေနတဲ့ အပုိင္းပါ၊
SourceCode ေတြ Download တဲ့ process ကေတာ့ Internet connection ေပၚမွာ မူတည္ၿပီးၾကာပါလိမ့္မယ္။

