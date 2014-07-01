#!/bin/sh
set -e
md5sum -c init_checkfiles_list.txt
git clone https://github.com/AndroidRoot/BootTools.git
cd BootTools
make
cd ..
7z -okernel_orig x kernel_kexec_grouper_441.zip
7z -opackdir x lpv79_hammerhead.zip
7z x sysimg_armv7a-L_r01.zip
mkdir sysdir
cd sysdir
tar xf ../packdir/rom/system.tar.gz
cd ..
git checkout -- packdir
7z -okoushsuperuser x superuser.zip
