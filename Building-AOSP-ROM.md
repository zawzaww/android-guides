# How To Build an AOSP ROM for Android Devices

## AOSP - Android Open Source Project
## Building Pure Android OS

# Introduction
   ဒီတခါေတာ့ ကြၽန္ေတာ္ေျပာျပမယ့္အေၾကာင္းအရာကေတာ့ AOSP SourceCode ကေန ကုိယ့္ရဲ႕ Android Device အတြက္ Pure Android OS တခု ဘယ္လုိ Build မလဲဆုိတဲ့ အေၾကာင္းအရာပါ။ အခုနည္းကုိ သိသြားၿပီဆုိရင္ တျခားေသာ AOSP based ROM ေတြေရာ LineageOS based ROM ေတြေရာ build တတ္သြားပါလိမ့္မယ္၊ တခုပဲကြဲျပားသြားတာပါ Android SourceCode ယူရတဲ့ ေနရာပဲကြဲသြားတာပါ။ တခုေတာ့ သတိေပးထားပါရေစ Android ရဲ႕ SourceCode ေတြရဲ႕ filesize က 20GB နဲ႔ အထက္မွာ ႐ွိပါတယ္။ အဲဒါေၾကာင့္ Internet ေကာင္းမွပဲ အဆင္ေျပပါလိမ့္မယ္။ Build တဲ့ ေနရာမွာ Linux မွာေရာ Mac မွာေရာ build လုိ႔ရပါတယ္ ကြၽန္ေတာ္ကေတာ့ Linux နဲ႔ပဲ target ထားၿပီးေျပာသြားမွာျဖစ္ၿပီး၊ Build မယ့္ target Android Device က Nexus 5X နဲ႔ ဥပမာေပးၿပီး ေျပာျပသြားမွာ ျဖစ္ပါတယ္။

# Requirements
- Linux OS သုံးထားတဲ့ Computer တလုံး႐ွိရပါမယ္
- OpenJDK Install ထားရပါမယ္
- Python 2.7+ Install ထားရပါမယ္ ( ဘာလုိ႔လဲဆုိေတာ့ Google ရဲ့ git-repo က Python နဲ႔ေရးထားတာပါ၊ အဲဒါေၾကာင့္ Python Install လုပ္မထားရင္ git-repo က အလုပ္မလုပ္ပါဘူး )
- Git အသုံးျပဳတတ္ရပါမယ္
- Google ရဲ႕ git-repo လည္း သုံးတတ္ရပါမယ္
https://code.google.com/archive/p/git-repo/
( git-repo ဆုိတာ Google က develop ထားတဲ့ repo tool တခုပါ၊ android ROM Development မွာ အရမ္းအသုံးဝင္ပါတယ္၊ git-repo - Multiple Repository Tool လုိ႔ေခၚပါတယ္၊ သူ႔ရဲ႕ အသုံးဝင္ပုံက Repo တခုေဆာက္ၿပီး အဲဒီထဲမွာ .xml file ေလးတခုေဆာက္ၿပီး ကုိယ္လုိခ်င္တဲ့ ကုိယ္ remote လုပ္ခ်င္တဲ့ repo ေတြကုိအမ်ာႀကီးကုိ link ေပးၿပီး repo sync ဆုိတဲ့ command ကုိသုံးၿပီး၊ ကုိယ့္ရဲ႕ Local machine ထဲကုိ တေနရာတည္းမွာပဲ repo ေတြအမ်ာႀကီးကုိ download ဆြဲလုိ႔ရပါတယ္၊ သေဘာက ROM တခု build ဖုိ႔ လုိအပ္တဲ့ Android SourceCode Repository ေတြက အမ်ားႀကီးပါ အဲဒါကုိ တခုခ်င္းလုိက္ git clone မေနပဲ .xml file ေလးကေန Repository အမ်ားႀကီးစုၿပီး Local ထဲကုိ download ဆြဲလုိက္တဲ့ သေဘာပါပဲ။ )

# Setup Your Environment
## Installation OpenJDK
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

## Installation Python
- OpenJDK install ၿပီးရင္ Python install ေပးဖု႔ိ လုိပါတယ္၊ Python 2.7 ေလာက္ဆုိ အဆင္ေျပပါၿပီ။
```bash
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```

## Installation Build-Tools
- လုိအပ္တဲ့ build tools ေတြ install ဖုိ႔ ေအာက္ပါ command ေလးကုိ terminal မွာ ႐ုိက္ေပးပါ။
```bash
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl \
zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev \
x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils \
xsltproc unzip
```

## Installation Git and Repo (git-repo)
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
$ curl https://storage.googleapis.com/git-repo-downloads/repo > repo
$ chmod a+x repo
$ sudo install repo /usr/local/bin
$ rm repo
```
အဲဒါေတြ အကုန္ၿပီးသြားၿပီ ဆုိရင္ေတာ့ ROM တခု build ဖုိ႔အတြက္ Setup Environment ပုိင္းက ျပည့္စုံသြားပါၿပီ။
