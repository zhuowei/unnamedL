#!/bin/sh
if [ `whoami` != "root" ]
then
	echo "Run this as root"
	echo "sudo $0"
	exit
fi

test -e armeabi-v7a/tempmnt/build.prop && exit

mkdir armeabi-v7a/tempmnt
mount -o loop armeabi-v7a/system.img armeabi-v7a/tempmnt
