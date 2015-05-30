#!/bin/sh
rm repacked.zip
cd packdir
7z -mx=0 a ../repacked.zip META-INF rom scripts boot.img
