#!/bin/sh
mkdir overlay/xbin
cp koushsuperuser/armeabi/su overlay/xbin/
mkdir overlay/app
cp koushsuperuser/Superuser.apk overlay/app/
mkdir overlay/etc
cp koushsuperuser/install-recovery.sh overlay/etc/
