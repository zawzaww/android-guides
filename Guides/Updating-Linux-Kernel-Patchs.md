# How To Update Linux Kernel Version For Android Devices
 
# Indroduction
  ဒီတခါက ဘာအေၾကာင္းအရာလဲ ဆိုေတာ့ ကိုယ့္ရဲ့ Android Device အတြက္ Build လိုက္တဲ့ Kernel မွာ Linux Kernel version ကို ဘယ္လို Update လုပ္မလဲ ဆိုတဲ့ အေၾကာင္းအရာပါ။ Linux Kernel release တဲ့ ပိုင္းမွာ (၄)မ်ိဳး ကြဲျပားပါတယ္ ( Prepatch, Mainline, Stable & Long Term ) ဆိုၿပီး ရွိပါတယ္။ အေသးစိတ္ကိုေတာ့ ဒီမွာ ေလ့လာၾကည့္ပါ https://www.kernel.org/category/releases.html ပထမ tutorial မွာလည္း ကၽြန္ေတာ္ေျပာခဲ့ပါတယ္ Android မွာ သုံးတဲ့ Linux Kernel branch ေတြက Long Term Support (LTS) branch ေတြျဖစ္ပါတယ္။ Linux Kernel LTS branch ေတြအမ်ားႀကီး ရွိပါတယ္။ Android ဖုန္း အမ်ိဳးအစားေပၚ မူတည္ၿပီး သုံးတဲ့ Linux Kernel LTS branch ေတြက မတူနိုင္ပါဘူး။ ဥပမာ အေနနဲ႔ ေျပာျပရရင္ Nexus 5X မွာဆိုရင္ [linux-3.10.y](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.10.y) ဆိုတဲ့ LTS branch ကိုသုံးၿပီး၊ Google Pixel မွာဆိုရင္ [linux-3.18.y](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.18.y) ဆိုတဲ့ LTS branch ကို သုံးပါတယ္။ ၿပီးမွ အဲဒီ သက္ဆိုင္ရာ Linux kernel branch ေတြကို အေျခခံၿပီး အသုံးခ်ၿပီး Android ဘက္က Engineer ေတြ သူတို႔ရဲ့ Android Mobile Device အတြက္ ကိုက္ညီမႈရွိေအာင္ ျပန္ Modifed ခဲ့တဲ့သေဘာပါပဲ။ ဒါေၾကာင့္ ကိုယ့္ဖုန္းအတြက္ Kernel source ယူရင္ Android ဘက္က Engineer ေပးတဲ့ သက္ဆိုင္ရာဖုန္းအတြက္ Kernel source ေတြယူရၿပီး၊ Linux kernel version update ေတြ လုပ္ခ်င္ရင္ မူရင္း kernel.org site ကေန git. ကိုသုံးၿပီး code ေတြ merge ၿပီး ကိုယ့္ဖုန္းအတြက္ kernel version ေတြ update လုပ္ေပးရမွာပါ။ ေနာက္တခုက Android ဘက္ကလူေတြက ဘယ္ေတာ့မွ Linux kernel version ေတြကို latest လုပ္မေပးပါဘူး၊ kernel source မွာ ပါလာတဲ့ built-in kernel version အျမဲနိမ့္ပါတယ္၊ ဥပမာ အေနနဲ႔ ေျပာေပးရရင္ Nexus 5X မွာ linux-v3.10.73 နဲ႔ default လာပါတယ္၊ ခုလက္ရွိ Latest က linux-v3.10.107 ပါ၊ အဲဒါေၾကာင့္ ကိုယ္တိုင္ လုပ္ေပးနိုင္ရင္ အေကာင္းဆုံးပါပဲ။ တခ်ိဳ႕ေသာ Android ဘက္က Developer ေတြက ေျပာၾကပါတယ္ Android ရဲ့ linux kernel branch က LTS ျဖစ္လို႔ update မလုပ္လည္း ဘာျပႆနာမွ မရွိပါဘူး ေရရွည္ Support နိုင္တဲ့ ဆိုတဲ့သေဘာမ်ိဳးကို ေျပာၾကပါတယ္။ မွန္ေတာ့မွန္ပါတယ္ ဒါေပမယ့္လည္း ကၽြန္ေတာ္ကေတာ့ အဲဒါကို သိပ္သေဘာမက်ပါဘူး၊ ပုံမွန္ linux kernel update ေတြ update လုပ္ရတာ သေဘာက်ပါတယ္။ ဒါေၾကာင့္ အခု Tutorial မွာ git ကိုသုံးၿပီး linux kernel site ကေန ကိုယ့္ဖုန္းအတြက္ Kernel version ကို ဘယ္လို update လုပ္မလဲ ဘယ္လို linux kernel Code(C Programming Code) ေတြ ဘယ္လို merge လုပ္မလဲ ဆိုတာ ဆက္ေရးပါမယ္။ ဒီေနရာမွာ နည္းနည္း ေျပာျပခ်င္ပါတယ္ Linux kernel Repo က C နဲ႔ ေရးပါတယ္၊ တကယ္တမ္း ကိုယ့္ဖုန္းအတြက္ code ေတြ merge ရင္ အနည္းနဲ႔ အမ်ား "merge conflicts" ေတြျဖစ္နိုင္ပါတယ္၊ အဲဒါေၾကာင့္ conflicts ေတြရွင္းနိုင္တဲ့ အရည္အခ်င္းေတာ့ ရွိရပါမယ္၊ အဲလိုမွ မရွင္းနိုင္ရင္ Compiler ကေန compile ေနတဲ့အခ်ိန္ Terminal ကေန error code ေတြျပေပးၿပီး Kernel image ေတြ ထြက္မလာနိုင္ေတာ့ပါဘူး၊ တနည္းအားျဖင့္ ဒီအတိုင္းႀကီးရွင္းတာထက္ စာရင္ C Programming Language ကို ေလ့လာၿပီး ေကာင္းေကာင္း နားလည္ထားရင္ အေကာင္းဆုံးပါပဲ။

 
# Requirements
- Linux OS သုံး Computer တလုံး
- Git သုံးတတ္ရပါမယ္ 
- C Programming ကို basic ေလာက္ေတာ့ သိရပါမယ္
 
 
# How To Update
- ဘယ္လို Linux Kernel version ကို Update လုပ္မလဲ ဆိုတဲ့ ေနရာမွာ ႏွစ္မ်ိဳးရွိပါတယ္၊ [git merge] ကိုသုံးၿပီး code ေတြ merge တဲ့နည္းရယ္၊ [git cherry-pick] ကိုသုံးၿပီး code ေတြ merge တဲ့ နည္းရယ္ ဆိုၿပီး ရွိပါတယ္။
- အႀကံေပးခ်င္ပါတယ္ ခုမွ git နဲ႔ စထိေတြ႕မယ့္သူဆို git cherry-pick နည္းပဲ သုံးပါလို႔ အႀကံေပးခ်င္ပါတယ္၊ မဟုတ္ရင္ tag ေတြသုံးၿပီး git merge ကိုသုံးရင္ conflicts ေတြ ေထာင္ေသာင္းခ်ီသြားပါလိမ့္မယ္။
- ပထမဦးဆုံး အေနနဲ႔ ကိုယ့္ Computer ထဲမွာ git install ထားဖို႔လိုပါတယ္။
 
## Method(1) : git merge
- ပထမဦးဆုံး အေနနဲ႔ linux kernel branch ေတြရွိတဲ့ ေနရာ သိရပါမယ္ Link...https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/
<img src="https://s20.postimg.org/9ormx6trx/Screenshot_from_2018-03-08_10-17-42.png" /> 

- ေနာက္တခုက ကိုယ့္ဖုန္းအတြက္ Kernel source က ဘယ္ linux kernel branch ကို သုံးလဲ ဆိုတာ သိရပါမယ္၊ ဥပမာ kernel-source/Makefile ကို ဖြင့္ၾကည့္လိုက္ပါ၊ Nexus 5X မွဆို 3.10.73 ဆိုၿပီး ေတြ႕ရပါမယ္။
- Format
```bush
VERSION = 3
PATCHLEVEL = 10
SUBLEVEL = 73
EXTRAVERSION =
NAME = TOSSUG Baby Fish
```
- အေပၚက format ကို ၾကည့္ရင္ 3 10 ဆိုတာ linux kernel branch မွာဆိုရင္ linux-3.10.y ကို ဆိုလိုျခင္း ျဖစ္ပါတယ္။
- အခု git command ေတြသုံးၿပီး code ေတြ merge ပါမယ္။
- အရင္ ကိုယ့္ဖုန္းအတြက္ download ထားတဲ့ Kernel source folder ထဲဝင္ၿပီး Right Click ၿပီး Terminal ကို ဖြင့္လိုက္ၿပီး ေအာက္က command ေလး ရိုက္လိုက္ပါ။ (Nexus 5X အတြက္ျဖစ္လို႔ branch name က linux-3.10.y ပါ)
- Format ( git merge မလုပ္ခင္ git fetch အရင္ လုပ္ေပးရပါမယ္ )
```bush
git fetch --tags <repo_url> <branch_name>
```
- Example: for Nexus 5X
```bush
git fetch --tags https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/ linux-3.10.y
```
<img src="https://s20.postimg.org/ijsh7pqa5/Screenshot_from_2018-03-08_10-18-14.png" />

- git fetch လုပ္တာက Internet connection ေပၚ မူတည္ၿပီး ၾကာပါမယ္၊ ၿပီးသြားရင္ tags အလိုက္ေတြ Terminal မွာ စီၿပီးျပေပးပါလိမ့္မယ္။
- git merge ပါေတာ့မယ္။ (ဒီေနရာက အေရးႀကီးပါတယ္ ခုလက္ရွိ ကိုယ့္ Kernel source ထဲက Makefile မွာ တခ်က္ေလာက္ ၾကည့္လိုက္ပါ kernel version ကို 3.10.73 ဆိုရင္ ေနာက္ git mergeရင္ .74 ကို တဆင့္ခ်င္း merge ပါ၊ မဟုတ္ဘူးဆိုရင္ Latest .108 ကို တန္းၿပီး mergeရင္ merge conflicts ေတြမ်ားသြားပါလိမ့္မယ္)
- Format
```bush
git merge <tag_name>
```
- Example for Nexus 5X
```bush
git merge v3.10.74
```

```bush
git merge v3.10.75
```

```bush
git merge v3.10.76
```

```bush
git merge v3.10.77
```

```bush
git merge v3.10.78
```

```bush
git merge v3.10.79
```

```bush
git merge v3.10.80
```
- Continue...
- git merge တာကို Linux version တဆင့္ခ်င္းစီ Merge ေပးပါ v3.10.74, 75, 76, 78, 79, 80, 81 ကေန ဆက္ၿပီးေတာာ့ လက္ရွိ 3.10.y branch ရဲ့ ေနာက္ဆုံး version ျဖစ္တဲ့ 108 ထိ Merge ေပးပါ (73 ကေန 108  တန္းၿပီး Merge မလုပ္ပါနဲ႔ တဆင့္ခ်င္းစီ Merge တာက နည္းလမ္းအမွန္ပါပဲ)


```bush
git merge v3.10.108
```


## Method(2) : git cherry-pick
- git cherry-pick တဲ့ေနရာမွာ အမွန္က ႏွစ္မ်ိဳးရွိပါတယ္၊ tag အလိုက္ cherry-pick တာရယ္ commit အလိုက္ cherry- pick တာရယ္ ဆိုၿပီး ရွိပါတယ္၊ မေျပာေတာ့ပါဘူး လြယ္လြယ္နဲ႔ ျမန္ျမန္လုပ္လို႔ရမယ့္ commit အလိုက္ cherry-pick တာပဲ ေျပာပါမယ္။
- ပထမဆုံး git fetch အရင္လုပ္ေပးရပါမယ္။
- Format
```bush
git fetch <repo_url> <branch_name>
```
- Example: for Nexus 5X
```bush
git fetch https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/ linux-3.10.y
```
<img src="https://s20.postimg.org/ijsh7pqa5/Screenshot_from_2018-03-08_10-18-14.png" />

- ၿပီးသြားရင္ ကိုယ္ Update ခ်င္တဲ့ Linux kernel version Page ထိ သြားရပါမယ္၊ ဥပမာ Nexus 5X အတြက္ Linux v3.10.73 ကေန v3.10.74 ကို update ခ်င္ရင္ https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.10.y သြားပါ၊ အဲဒီမွာ v3.10.74 ဆိုတဲ့ Yellow color tag နဲ့ Page ထိ သြားပါ၊ အဲဒီ အေပၚဆုံးက Linux 3.10.74 commit က အခုလက္ရွိ kernel version(3.10.74) ရဲဲ့ last commit ပါ၊ ၿပီးရင္ေအာက္ထိ ဆင္းပါ၊ အဝါေရာင္ေလးနဲ႔ ေရးထားတဲ့ tag ေလး v3.10.73 ထိ သြားၿပီး၊ အဲဒီအပၚ commit တေၾကာင္းက Linux kernel version(3.10.74) ရဲ first commit ပါ။ (ဒီေနရာမွာက ေျပာခ်င္တာက first commit နဲ႔ last commit အေၾကာင္းပါ )

<img src="https://s20.postimg.org/f06jhxxv1/Screenshot_from_2018-03-08_10-20-32.png" />

- First commit နဲ႔ Last commit အေၾကာင္း အေပၚမွာ ရွင္းျပထားပါတယ္၊ အဲဒါ git cherry-pick တဲ့ ေနရာမွာ ျပန္သုံးရမွာပါ၊ အဲဒါေၾကာင့္ ရွင္းျပတာပါ။
- အေပၚမွာ git fetch သြားတာ ၿပီးသြားရင္ ဒီ command ေလး ရိုက္လိုက္ပါ
- Format (သေဘာက Linux 3.0.74 အတြက္ commit ထားတဲ့ code အေတြအကုန္ ကိုယ့္ Repo ထဲ merge လုပ္သြားပါလိမ့္မယ္)
```bush
git cherry-pick <first_commit>^..<last_commit>
```
- Example: (အဲဒါေတြက <commit_hash> ေတြပါ copy ၿပီး paste လိုက္တာပါ)
- First commit of v3.10.74...
[70bd96c4dfffc1e34a7e9225220405e0adb93d69](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?h=v3.10.74&id=70bd96c4dfffc1e34a7e9225220405e0adb93d69)
- Last commit of v3.10.74...
[	c9ef473a544f0c10e631c25e631f31f9dc0eaed7](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?h=v3.10.74&id=c9ef473a544f0c10e631c25e631f31f9dc0eaed7)

```bush
git cherry-pick 70bd96c4dfffc1e34a7e9225220405e0adb93d69^..c9ef473a544f0c10e631c25e631f31f9dc0eaed7
```
<img src="https://s20.postimg.org/c63e4h0tp/Screenshot_from_2018-03-08_10-20-01.png" />
<img src="https://s20.postimg.org/msx79woel/Screenshot_from_2018-03-08_10-20-17.png" />
 
 (OR)

- ဒါက commit တခုခ်င္းစီ git cherry-pick တဲ့ နည္းပါ
- Format
```bush
git cherry-pick <commit_hash>
```
Example: (v3.10.74 first commit ကေန last commit ထဲ တခုခ်င္းစီ merge တဲ့နည္းပါ၊ စိတ္ရွည္ဖို႔ေတာ့ လိုပါတယ္ commit ေတြက မ်ားႀကီးပါပဲ)
```bush
 git cherry-pick 70bd96c4dfffc1e34a7e9225220405e0adb93d69
 git cherry-pick 574947bf3ce72410455e76d11ac57c3da69d36d8
 git cherry-pick 1290b015b701b4c772251e63da5866974e5ccb77
 Continue... latest commit of Linux v3.10.74
```

- အဲဒါေတြ ၿပီးသြားရင္ Merge တဲ့ လုပ္ငန္းေတာ့ ၿပီးသြားၿပီ။
- အဲဒီေနာက္ ပထမက Kernel-Building Tutorial အတိုင္း ျပန္ Compile လိုက္ပါ။
- တကယ္လို႔ Merge conflicts ေတြ ျဖစ္ခဲ့ရင္ Terminal ကေန code error ေတြ line no. အတိအက်ေျပာေပးပါလိမ့္မယ္။ (C Programmig Language ကို အနည္းအပါး ရရင္ ေျဖရွင္းနိုင္ပါ လိမ့္မယ္)
- Conflicts ေတြ ေျဖရွင္းတဲ့ နည္းလမ္းေတြ ေနာက္ထက္ သက္သက္ဆက္ေရးပါ့မယ္။
- DONE

Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)

Copyright (C) 2018, ZawZaw.
