# this should be run as root
sed -e "s/\/sdcard\/multirom\/roms\/repacked\/system\//staging\//" perms_pulled.sh >reperm.sh
cp -r overlay staging
chown -R root:root staging
bash reperm.sh
rsync -a armeabi-v7a/tempmnt/ staging2
rsync -a staging/ staging2/
cd staging2
tar cf ../staging.tar.gz .
cd ..
mv staging.tar.gz packdir/rom/system.tar.gz
