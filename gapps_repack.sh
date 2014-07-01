#!/bin/sh
# the plan:
# do a find; for each file in the gapp repack, rewrite the path and find the same file in sysdir
rm -r gapps-staging
cp -r gapps-orig gapps-staging
for a in `find gapps-orig/system -type f`
do
	#echo $a
	newname=`echo "$a"|sed -e "s/^gapps-orig\/system/sysdir/"`
	newloc=`echo "$a"|sed -e "s/^gapps-orig/gapps-staging/"`
	if echo $a | grep "/GmsCore.apk"
	then
		rm $newloc
		cp sysdir/priv-app/PrebuiltGmsCore.apk gapps-staging/system/priv-app/
		continue
	fi
	if [ -e $newname ]
	then
		cp $newname $newloc
	else
		echo "Cannot find $newname!"
	fi
done
rm gapps-repacked.zip
cd gapps-staging
7z a ../gapps-repacked.zip .
