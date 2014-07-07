cat syslist.txt|xargs -I POTATO adb pull /system/POTATO overlay/POTATO
git checkout -- overlay/lib/hw/bluetooth.default.so
