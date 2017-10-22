  # How To Update Latest Linux Kernel Version For Android Devices
 
# Indroduction
  ဒီတခါက ဘာအကြောင်းအရာလဲ ဆိုတော့ ကိုယ့်ရဲ့ Android Device အတွက် Build လိုက်တဲ့ Kernel မှာ Linux Kernel version ကို ဘယ်လို Update လုပ်မလဲ ဆိုတဲ့ အကြောင်းအရာပါ။ Linux Kernel release တဲ့ ပိုင်းမှာ (၄)မျိုး ကွဲပြားပါတယ် ( Prepatch, Mainline, Stable & Long Term ) ဆိုပြီး ရှိပါတယ်။ အသေးစိတ်ကိုတော့ ဒီမှာ လေ့လာကြည့်ပါ https://www.kernel.org/category/releases.html ပထမ tutorial မှာလည်း ကျွန်တော်ပြောခဲ့ပါတယ် Android မှာ သုံးတဲ့ Linux Kernel branch တွေက Long Term Support (LTS) branch တွေဖြစ်ပါတယ်။ Linux Kernel LTS branch တွေအများကြီး ရှိပါတယ်။ Android ဖုန်း အမျိုးအစားပေါ် မူတည်ပြီး သုံးတဲ့ Linux Kernel LTS branch တွေက မတူနိုင်ပါဘူး။ ဥပမာ အနေနဲ့ ပြောပြရရင် Nexus 5X မှာဆိုရင် [linux-3.10.y](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.10.y) ဆိုတဲ့ LTS branch ကိုသုံးပြီး၊ Google Pixel မှာဆိုရင် [linux-3.18.y](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.18.y) ဆိုတဲ့ LTS branch ကို သုံးပါတယ်။ ပြီးမှ အဲဒီ သက်ဆိုင်ရာ Linux kernel branch တွေကို အခြေခံပြီး အသုံးချပြီး Android ဘက်က Engineer တွေ သူတို့ရဲ့ Android Mobile Device အတွက် ကိုက်ညီမှုရှိအောင် ပြန် Modifed ခဲ့တဲ့သဘောပါပဲ။ ဒါကြောင့် ကိုယ့်ဖုန်းအတွက် Kernel source ယူရင် Android ဘက်က Engineer ပေးတဲ့ သက်ဆိုင်ရာဖုန်းအတွက် Kernel source တွေယူရပြီး၊ Linux kernel version update တွေ လုပ်ချင်ရင် မူရင်း kernel.org site ကနေ git. ကိုသုံးပြီး code တွေ merge ပြီး ကိုယ့်ဖုန်းအတွက် kernel version တွေ update လုပ်ပေးရမှာပါ။ နောက်တခုက Android ဘက်ကလူတွေက ဘယ်တော့မှ Linux kernel version တွေကို latest လုပ်မပေးပါဘူး၊ kernel source မှာ ပါလာတဲ့ built-in kernel version အမြဲနိမ့်ပါတယ်၊ ဥပမာ အနေနဲ့ ပြောပေးရရင် Nexus 5X မှာ linux-v3.10.73 နဲ့ default လာပါတယ်၊ ခုလက်ရှိ Latest က linux-v3.10.107 ပါ၊ အဲဒါကြောင့် ကိုယ်တိုင် လုပ်ပေးနိုင်ရင် အကောင်းဆုံးပါပဲ။ တချို့သော Android ဘက်က Developer တွေက ပြောကြပါတယ် Android ရဲ့ linux kernel branch က LTS ဖြစ်လို့ update မလုပ်လည်း ဘာပြဿနာမှ မရှိပါဘူး ရေရှည် Support နိုင်တဲ့ ဆိုတဲ့သဘောမျိုးကို ပြောကြပါတယ်။ မှန်တော့မှန်ပါတယ် ဒါပေမယ့်လည်း ကျွန်တော်ကတော့ အဲဒါကို သိပ်သဘောမကျပါဘူး၊ ပုံမှန် linux kernel update တွေ update လုပ်ရတာ သဘောကျပါတယ်။ ဒါကြောင့် အခု Tutorial မှာ git ကိုသုံးပြီး linux kernel site ကနေ ကိုယ့်ဖုန်းအတွက် Kernel version ကို ဘယ်လို update လုပ်မလဲ ဘယ်လို linux kernel Code(C Programming Code) တွေ ဘယ်လို merge လုပ်မလဲ ဆိုတာ ဆက်ရေးပါမယ်။ ဒီနေရာမှာ နည်းနည်း ပြောပြချင်ပါတယ် Linux kernel Repo က C နဲ့ ရေးပါတယ်၊ တကယ်တမ်း ကိုယ့်ဖုန်းအတွက် code တွေ merge ရင် အနည်းနဲ့ အများ "merge conflicts" တွေဖြစ်နိုင်ပါတယ်၊ အဲဒါကြောင့် conflicts တွေရှင်းနိုင်တဲ့ အရည်အချင်းတော့ ရှိရပါမယ်၊ အဲလိုမှ မရှင်းနိုင်ရင် Compiler ကနေ compile နေတဲ့အချိန် Terminal ကနေ error code တွေပြပေးပြီး Kernel image တွေ ထွက်မလာနိုင်တော့ပါဘူး၊ တနည်းအားဖြင့် ဒီအတိုင်းကြီးရှင်းတာထက် စာရင် C Programming Language ကို လေ့လာပြီး ကောင်းကောင်း နားလည်ထားရင် အကောင်းဆုံးပါပဲ။

 
# Requirements
- Linux OS သုံး Computer တလုံး
- Git သုံးတတ်ရပါမယ် 
- C Programming ကို basic လောက်တော့ သိရပါမယ်
 
 
# How To Update
- ဘယ်လို Linux Kernel version ကို Update လုပ်မလဲ ဆိုတဲ့ နေရာမှာ နှစ်မျိုးရှိပါတယ်၊ [git merge] ကိုသုံးပြီး code တွေ merge တဲ့နည်းရယ်၊ [git cherry-pick] ကိုသုံးပြီး code တွေ merge တဲ့ နည်းရယ် ဆိုပြီး ရှိပါတယ်။
- အကြံပေးချင်ပါတယ် ခုမှ git နဲ့ စထိတွေ့မယ့်သူဆို git cherry-pick နည်းပဲ သုံးပါလို့ အကြံပေးချင်ပါတယ်၊ မဟုတ်ရင် tag တွေသုံးပြီး git merge ကိုသုံးရင် conflicts တွေ ထောင်သောင်းချီသွားပါလိမ့်မယ်။
- ပထမဦးဆုံး အနေနဲ့ ကိုယ့် Computer ထဲမှာ git install ထားဖို့လိုပါတယ်။
 
## Method(1) : git merge
- ပထမဦးဆုံး အနေနဲ့ linux kernel branch တွေရှိတဲ့ နေရာ သိရပါမယ် Link...https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/
- နောက်တခုက ကိုယ့်ဖုန်းအတွက် Kernel source က ဘယ် linux kernel branch ကို သုံးလဲ ဆိုတာ သိရပါမယ်၊ ဥပမာ ပြောပြပါမယ် kernel-source/Makefile ကို ဖွင့်ကြည့်လိုက်ပါ၊ Nexus 5X မှဆို 3.10.73 ဆိုပြီး တွေ့ရပါမယ်။
- Format
```bush
VERSION = 3
PATCHLEVEL = 10
SUBLEVEL = 73
EXTRAVERSION =
NAME = TOSSUG Baby Fish
```
- အပေါ်က format ကို ကြည့်ရင် 3 10 ဆိုတာ linux kernel branch မှာဆိုရင် linux-3.10.y ကို ဆိုလိုခြင်း ဖြစ်ပါတယ်။
- အခု git command တွေသုံးပြီး code တွေ merge ပါမယ်။
- အရင် ကိုယ့်ဖုန်းအတွက် download ထားတဲ့ Kernel source folder ထဲဝင်ပြီး Right Click ပြီး Terminal ကို ဖွင့်လိုက်ပြီး အောက်က command လေး ရိုက်လိုက်ပါ။ ( Nexus 5X အတွက်ဖြစ်လို့ branch name က linux-3.10.y ပါ )
- Format ( git merge မလုပ်ခင် git fetch အရင် လုပ်ပေးရပါမယ် )
```bush
git fetch --tags <repo-url> <branch-name>
```
- Example: for Nexus 5X
```bush
git fetch --tags https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/ linux-3.10.y
```
- git fetch လုပ်တာက Internet connectio ပေါ် မူတည်ပြီး ကြာပါမယ်၊ ပြီးသွားရင် tags အလိုက်တွေ Terminal မှာ စီပြီးပြပေးပါလိမ့်မယ်။
- git merge ပါတော့မယ်။ (ဒီနေရာက အရေးကြီးပါတယ် ခုလက်ရှိ ကိုယ့် Kernel source ထဲက Makefile မှာ တချက်လောက် ကြည့်လိုက်ပါ kernel version ကို 3.10.73 ဆိုရင် နောက် git mergeရင် .74 ကို တဆင့်ချင်း merge ပါ၊ မဟုတ်ဘူးဆိုရင် Latest .107 ကို တန်းပြီး mergeရင် merge conflicts တွေများသွားပါလိမ့်မယ်)
- Format
```bush
git merge <tag-name>
```
- Example for Nexus 5X
```bush
git merge v3.10.74
```
- ဒါမှမဟုတ် Latest version ကို တန်း merge ရဲရင်လည်း merge ပါ conflicts တွေကများလို့ စိတ်တော့ မညစ်နဲ့ :P (စတာပါ ဟီးဟီး)
```bush
git merge v3.10.107
```

 
## Method(2) : git cherry-pick
- git cherry-pick တဲ့နေရာမှာ အမှန်က နှစ်မျိုးရှိပါတယ်၊ tag အလိုက် cherry-pick တာရယ် commit အလိုက် cherry- pick တာရယ် ဆိုပြီး ရှိပါတယ်၊ မပြောတော့ပါဘူး လွယ်လွယ်နဲ့ မြန်မြန်လုပ်လို့ရမယ့် commit အလိုက် cherry-pick တာပဲ ပြောပါမယ်။
- ပထမဆုံး git fetch အရင်လုပ်ပေးရပါမယ်။
- Format
```bush
git fetch <repo_url> <branch_name>
```
- Example: for Nexus 5X
```bush
git fetch https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/ linux-3.10.y
```
- ပြီးသွားရင် ကိုယ် Update ချင်တဲ့ Linux kernel version Page ထိ သွားရပါမယ်၊ ဥပမာ Nexus 5X အတွက် linux v3.10.107 ကို update ချင်ရင် https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/?h=linux-3.10.y သွားပါ၊ အဲဒီမှာ အပေါ်ဆုံးမှ Linux 3.10.107 ဆိုတဲ့ commit တွေ့ပါလိမ့်မယ် အဲဒါ အခုလက်ရှိ Latest kernel version(3.10.107) ရဲဲ့ last commit ပါ၊ ပြီးရင်အောက်ထိ ဆင်းပါ [next] ကိုနှိတ်ပါ ဘယ်ထိသွားရမလဲ ဆိုရင် အဝါရောင်လေးနဲ့ ရေးထားတဲ့ tag လေး v3.10.106 ထိ သွားပြီး၊ အဲဒီအပါ် commit တကြောင်း Latest kernel version(3.10.107) ရဲ first commit ပါ။ (ဒီနေရာမှာက ပြောချင်တာက first commit နဲ့ last commit အကြောင်းပါ )
- First commit နဲ့ Last commit အကြောင်း အပေါ်မှာ ရှင်းပြထားပါတယ်၊ အဲဒါ git cherry-pick တဲ့ နေရာမှာ ပြန်သုံးရမှာပါ၊ အဲဒါကြောင့် ရှင်းပြတာပါ။
- အပေါ်မှာ git fetch သွားတာ ပြီးသွားရင် ဒီ command လေး ရိုက်လိုက်ပါ
- Format (သဘောက Linux 3.0.107 အတွက် commit ထားတဲ့ code အတွေအကုန် ကိုယ့် Repo ထဲ merge လုပ်သွားပါလိမ့်မယ်)
```bush
git cherry-pick <first_commit>^..<last_commit>
```

- Example: (အဲဒါတွေက <commit_hash> တွေပါ copy ပြီး paste လိုက်တာပါ)
- First commit...https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=0ee88216358c4a1821022763cb84d2b0550bf1e2
- Last commit...https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=0e3d5747a3ef9986d7617cec396850bf9d039309
```bush
git cherry-pick 0ee88216358c4a1821022763cb84d2b0550bf1e2^..0e3d5747a3ef9986d7617cec396850bf9d039309
```
 
- OR
- ဒါက commit တခုချင်းစီ git cherry-pick တဲ့ နည်းပါ
- Format
```bush
git cherry-pick <commit_hash>
```
Example: ( first commit ကနေ last commit ထဲ တခုချင်းစီ merge တဲ့နည်းပါ၊ စိတ်ရှည်ဖို့တော့ လိုပါတယ် commit တွေက များကြီးပါပဲ )
```bush
 git cherry-pick 0ee88216358c4a1821022763cb84d2b0550bf1e2
 git cherry-pick de714a8a75b6985452fe6e5d3f6393eb1da2eb3d
 git cherry-pick 408d8245b80b5426d670de4b4ec60f24b05eb0ef
 Continue...
```

- အဲဒါတွေ ပြီးသွားရင် Merge တဲ့ လုပ်ငန်းတော့ ပြီးသွားပြီ။
- အဲဒီနောက် ပထမက Kernel-Building Tutorial အတိုင်း ပြန် Compile လိုက်ပါ။
- တကယ်လို့ Merge conflicts တွေ ဖြစ်ခဲ့ရင် Terminal ကနေ code error တွေ line no. အတိအကျပြောပေးပါလိမ့်မယ်။ (C Programmig Language ကို အနည်းအပါး ရရင် ဖြေရှင်းနိုင်ပါ လိမ့်မယ်)
- Conflicts တွေ ဖြေရှင်းတဲ့ နည်းလမ်းတွေ နောက်ထက် သက်သက်ဆက်ရေးပါ့မယ်။
- DONE

Regards,

Android Building Tutorials by ZawZaw [@xda-developers](https://forum.xda-developers.com/member.php?u=7581611)

https://github.com/zawzaww/android-building-tutorials/
