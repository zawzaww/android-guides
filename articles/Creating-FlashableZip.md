# How To Create FlashableZip for Android Kernel

# Introduction
အခု Guide က ပထမက ေရးခဲ့တဲ့ [How To Build Kernel](https://github.com/zawzaww/android-articles/blob/android/articles/Building-Android-Kernel.md) Guide ရဲ႕ အဆက္ျဖစ္ပါတယ္။ အဲဒီ ပထမပိုင္းကို ဖက္ၿပီးမွ ပိုအဆင္ေျပပါလိမ့္မယ္။ Kernel Source ကေန Compile ၿပီးလို႔ kernel img ေတြ ထြက္လာၿပီဆိုရင္ ကိုယ့္ရဲ႕ Android ဖုန္းအတြက္ Custom Recovery (TWRP) ကေန Kernel ကို Install လုပ္ဖို႔အတြက္ Kernel FlashableZip တခုလိုအပ္ပါတယ္။ အဲဒီအတြက္ FlashableZip Create နည္းကို ေျပာျပေပးမွာ ျဖစ္ပါတယ္။ XDA Recognized Developer တေယာက္ျဖစ္တဲ့ osm0sis ရဲ႕ AnyKernel2 - Android Kernel FlashableZip Template တခု ရွိပါတယ္။ အဲဒီ Template ကေန ကိုယ့္ဖုန္းအတြက္ ဘာေတြ ျပင္ဆင္ဖို႔ လိုအပ္လည္းဆိုတာ ဆက္ေျပာပါမယ္။

# How To Create
- အရင္ဆုံး AnyKernel2 Documentation နည္းနည္းဖက္ၾကည့္လုိက္ပါ လြယ္ပါတယ္။ 
https://github.com/osm0sis/AnyKernel2/blob/master/README.md
- အရင္ဆုံး AnyKernel2 ကုိ download လုိက္ပါ။

```bash
git clone https://github.com/osm0sis/AnyKernel2
```

<img src="https://cdn-images-1.medium.com/max/800/1*Mtv_oPxSpkJTmqM0reuQjA.png" />

- ဘာေတြလုိအပ္လည္း ဆုိရင္ Kernel name ျပင္ ေပးလုိ႔ရမယ္၊ device name သိရပါမယ္ (eg: LG Nexus 5X ဆုိ device name - bullhead)၊ ကုိယ့္ဖုန္းရဲ႕ boot partition location သိရမယ္၊ ramdisk ထဲမွာဆုိရင္ ကုိယ့္ဖုန္းရဲ႕ fstab.devicename (eg- fstab.bullhead) လုိပါတယ္၊ fstab ဆုိတာ file systems table ကုိေျပာတာပါ။
- ပထမဦးဆုံး အေနနဲ႔ Compile လုိ႔ရလာတဲ့ Image.gz-dtb (kernelsource/arch/arm64/boot/Image-gz-dtb) ကုိ Copy ကူးၿပီး ခုနက AnyKernel2 Folder ထဲ Paste လုိက္ပါ။
- ျပင္ရမယ့္ ေကာင္ေတြကုိ စေျပာပါမယ္။

## Kernel Name:
- AnyKernel2 ထဲက anykernel2.sh file ေလးကုိ Text Editor တခုခုနဲ႔ ဖြင္လုိက္ၿပီး kernel.string= kernel name ေရးလုိက္ပါ။

```bash
kernel.string=PureZ Kernel by ZawZaw @XDA-Developers
```

## Device Name:
- anykernel2.sh ကုိဖြင့္ၿပီး device.name1 နဲ႔ device.name2 ေနရာမွာ ကုိယ္႔ဖုန္းရဲ႕ device name ကုိ ေရးလုိက္ပါ။ (ဖုန္း အမ်ဳိးအစာေပၚ မူတည္ၿပီး device name ကြာသြားပါလိမ့္မယ္)
- Example: LG Nexus 5X - bullhead

```bash
device.name1=bullhead
device.name2=Bullhead
```

## Boot partition:
- ဒါက အေရးႀကီးပါတယ္ ကုိယ့္ဖုန္းအတြက္ boot partition location ကုိ အတိအက် သိရပါမယ္။ Nexus 5X ရဲ႕ boot partition သည္ `/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot` ျဖစ္ပါတယ္။ anykernel2.sh ထဲက `block=/dev/block/platform/…` ဆုိတဲ့ line မွာ ျပင္ေပးရမွာ ျဖစ္ပါတယ္။
(Warning: အဲဒါ အရမ္းအေရးႀကီးပါတယ္ ကုိယ့္ရဲ႕ဖုန္းေပၚမႈတည္ၿပီး ကြဲျပားသြားပါလိမ့္မယ္ သတိထားရမယ့္ တခ်က္တခုပါ)
- Example: For Nexus 5X

```bash
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
```

<img src= "https://cdn-images-1.medium.com/max/800/1*Q6PUEF1pMX8yrFjEVcjv7Q.png" />

## File Systems Table: fstab
Note: (ဒီအဆင့္က တကယ္ေတာ့ မထည့္လည္း ရပါတယ္။ ေက်ာ္သြားလုိ႔ရပါတယ္။ သိေအာင္ တမင္တကာ ထည့္ေရးလုိက္တာ။ Kernel Install လုပ္ဖု႔ိအတြက္ Kernel FlashableZip ျဖစ္႐ုံသက္သက္အတြက္ဆုိ ဒါေတြ မလုိအပ္ပါဘူး။ ဘာအတြက္ လုိအပ္တာလဲ ဆုိေတာ့ filesystem support (e.g - f2fs support) အပုိင္းေတြနဲ႔ Disable forced encryption and dm-verity လုပ္ဖု႔ိအတြက္ လုိအပ္ပါတယ္။ တနည္းအားျဖင့္ Android File System အေၾကာင္း ေကာင္းေကာင္းနားလည္မွ ဒါေတြ လုပ္ႏုိင္ပါလိမ့္မယ္။ [Android File System](http://techx.com.mm/features/249-things-to-know-about-android-file-system) အေၾကာင္းကုိ TechX Myanmar မွာ အရင္ဆုံး နားလည္ေအာင္ ဖက္ထားသင့္ပါတယ္။)
- AnyKernel2 ထဲမွာ ramdisk ဆုိတဲ့ folder ေလး႐ွိပါတယ္၊ အဲဒီ အထဲကုိ အေပၚမွာေျပာခဲ့တဲ့အတုိင္း Nexus 5X အတြက္ fstab (file systems table) file ေလး ကုိ သြားထည့္ရမွာပါ။ အဲဒီ fstab file ေလးထဲမွာ ဘာေတြ အဓိကပါလဲဆုိေတာ့ ကုိယ့္ဖုန္း ရဲ႕ /system, /data, /cache, /firmware, /boot, /recovery, /persist အစ႐ွိတဲ့ <mount_point> partition ေတြ ပါဝင္ပါတယ္။ ဒီ mount_point ေတြဆုိတာ filesystem path ေတြြြပဲ ျဖစ္ပါတယ္။ တနည္းအားျဖင့္္ ဒီ file ေလးက ကုိယ့္ဖုန္းရဲ႕ android file systems table ျဖစ္ပါတယ္။
- သူရဲ႕ format ေလးကုိ နည္းနည္းေရးျပပါမယ္။ (Android 4.3 နဲ႔ ေနာက္ပုိင္း version ေတြရဲ႕ ပုံစံပါ)
- ဒီထက္မက ေလ့လာခ်င္ရင္ AOSP site မွာ အျပည့္အစုံဖက္ႏုိင္ပါတယ္ https://source.android.com/devices/storage/config

```bash
<src> <mount_point> <type> <mount_flags> <fs_mgr_flags>
```

- Example: for Nexus 5X ( /system )

```bash
/dev/block/platform/soc.0/f9824900.sdhci/by-name/system       /system         ext4    ro,barrier=1,inode_readahead_blks=8                             wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/vendor       /vendor         ext4    ro,barrier=1,inode_readahead_blks=8                             wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/userdata     /data           ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic,inode_readahead_blks=8 wait,check,forcefdeorfbe=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata
/dev/block/platform/soc.0/f9824900.sdhci/by-name/cache        /cache          ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic wait,check
/dev/block/platform/soc.0/f9824900.sdhci/by-name/persist      /persist        ext4    noatime,nosuid,nodev,barrier=1,data=ordered,nodelalloc,nomblk_io_submit,errors=panic wait,notrim
/dev/block/platform/soc.0/f9824900.sdhci/by-name/modem        /firmware       vfat    ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337,context=u:object_r:firmware_file:s0        wait
/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot         /boot           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/recovery     /recovery       emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/misc         /misc           emmc    defaults                                                        defaults
/dev/block/platform/soc.0/f9824900.sdhci/by-name/modem        /radio          emmc    defaults               
```

- For Nexus 5X : [fstab.bullhead](https://android.googlesource.com/device/lge/bullhead/+/oreo-r6-release/fstab.bullhead)

<img src="https://cdn-images-1.medium.com/max/800/1*8d91QeQy0FkwzDb81utVWg.png" />

- အဲဒီ fstab file ကုိ AnyKernel2 ရဲ႕ ramdisk dir ေအာက္မွာ ထည့္ေပးရမွာ ျဖစ္ပါတယ္။

<img src="https://cdn-images-1.medium.com/max/800/1*HS3KrXSTkWsBI-j1jUFnQQ.png" />

- အဲဒါေတြ ေအာင္ျမင္ၿပီ ဆုုိုိုိုိရင္ FlashableZip တခု Create ပါမယ္။
- AnyKernel2 folder ထဲမွာ Right Click ေထာက္ၿပီး Terminal ကုိဖြင့္လုိက္ပါ။
- ဒီ command ေလးကုိ ႐ုိက္ေပးလုိက္ပါ။

```bash
zip -r9 Your-Kernel-Name.zip * -x README Your-Kernel-Name.zip
```

<img src="https://cdn-images-1.medium.com/max/800/1*o_Sz0SNsQvZIo0UB8oCrSA.png" />

- ၿပီးသြာရင္ AnyKernel2 folder ထဲမွာ Kernel Flashable Zip တခုထြက္လာပါၿပီ။

<img src="https://cdn-images-1.medium.com/max/800/1*9pYZldzILwgx7FvJJbGD-A.png" />

- ကုိယ့္ရဲ႕ Android ဖုန္းအတြက္ Kernel FlashableZip ကုိ TWRP Recovery ကေန Install ဖု႔ိ အဆင္သင့္ျဖစ္ပါၿပီ။
- DONE


Regards,

ZawZaw [@XDA-Developers](https://forum.xda-developers.com/member.php?u=7581611)
