#!/bin/sh
rm repacked.zip
cd packdir
7z a ../repacked.zip META-INF rom scripts file_contexts boot.img
