#!/bin/bash
set -e
function dodownload() {
echo "Go and download https://mega.co.nz/#!ZgU1EQBI!czQcw5k_eHWfq7ylEFCivdRNTnRceSX_gM1yjNh1AFM to this folder"
echo "then press Enter to continue"
read
pkgtoinstall=
type 7z || pkgtoinstall=$pkgtoinstall p7zip-full
type adb || pkgtoinstall=$pkgtoinstall android-tools-adb
if [ "$pkgtoinstall" != "" ]
then
	sudo apt-get install $pkgtoinstall
fi
./init_downloadfiles.sh
./init_unpack.sh
sudo ./init_mount.sh
./init_copy_res.sh
}

function dopull() {
echo "Boot device into recovery, and mount the system partition"
echo "then press Enter to continue"
read
echo "Pulling files from device"
./pullproprietaryblobs.sh || true
./pulloverlay.sh || true
echo "Pulling files from Nexus 5 rom"
./pullfromnexus5rom.sh || true
echo "Pulling permissions from device"
./pullpermsoverlay.sh || true
}

function dorebuildres() {
echo "Rebuilding resources"
cd resedit
./rebuild.sh
cd ..
}

if [ "$1" != "nodownload" ]
then
	dodownload
fi
dorebuildres
dopull
echo "Done. To build the ROM, run"
echo "sudo ./init_mount.sh"
echo "sudo ./stage_boot"
echo "sudo ./stage_repack.sh"
echo "./repack_zip.sh"
