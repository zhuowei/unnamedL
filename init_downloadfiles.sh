#!/bin/sh
set -e
for a in `cat init_downloadfiles_list.txt`
do
	rm `basename $a` || true
	wget $a
done
