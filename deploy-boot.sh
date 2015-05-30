BOOT=/sdcard/multirom/roms/repacked_m/boot
adb push boot-overlay $BOOT
adb push boot-overlay/init $BOOT/main_init
adb shell chmod 644 $BOOT/default.prop
adb shell chmod 750 $BOOT/init.rc
adb shell chmod 750 $BOOT/init.environ.rc
adb shell chmod 750 $BOOT/init.zygote32.rc
adb shell chmod 750 $BOOT/init.grouper.rc
adb shell chmod 750 $BOOT/sbin/adbd
adb shell chmod 750 $BOOT/main_init
