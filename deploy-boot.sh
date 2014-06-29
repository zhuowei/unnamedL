BOOT=/sdcard/multirom/roms/repacked/boot
adb push boot-overlay $BOOT
adb shell chmod 644 $BOOT/default.prop
adb shell chmod 750 $BOOT/init.rc
adb shell chmod 750 $BOOT/sbin/adbd
adb shell chmod 750 $BOOT/sbin/healthd
adb shell chmod 750 $BOOT/healthd-real
adb shell chmod 750 $BOOT/main_init
adb shell chmod 644 $BOOT/file_contexts
adb shell chmod 644 $BOOT/property_contexts
adb shell chmod 644 $BOOT/seapp_contexts
adb shell chmod 644 $BOOT/sepolicy
