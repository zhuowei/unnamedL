SYSTEM=/sdcard/multirom/roms/repacked/system
adb push overlay $SYSTEM
adb push perms_pulled.sh /sdcard/
adb shell sh /sdcard/perms_pulled.sh
