#!/bin/sh
for a in `cat proprietary-blobs.txt|grep -v "^#"`
do
	echo adb pull $a `echo $a|sed -e "s/^\/system/overlay/"`
	adb pull $a `echo $a|sed -e "s/^\/system/overlay/"`
done
