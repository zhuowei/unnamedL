#!/bin/sh
cp framework-res.apk framework-res.zip
7z a framework-res.zip res/xml/storage_list.xml
mv framework-res.zip ../overlay/framework/framework-res.apk
