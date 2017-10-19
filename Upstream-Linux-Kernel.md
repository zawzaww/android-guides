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
 Coming soon...
 
 
