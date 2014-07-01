## Building

I've only tested this process on my own computer (running Ubuntu 14.04 64-bit).

I tried to write some scripts to make setup easier, but they are not well tested, so if they don't work, it's your job to fix them ;)

Open a terminal into this repo and run
`
./init_all.sh
`

Follow the instructions. You will need a Nexus (2012) running stock 4.4.2 ROM (Other versions might work, I have not tested) in recovery mode attached to your computer.

This downloads and extracts all files.
`
sudo ./init_mount.sh
sudo ./stage_boot
sudo ./stage_repack.sh
`
This builds the boot.img and system.tar.gz

`
./repack_zip.sh
`

This creates the MultiROM-flashable file, named repacked.zip.

## License

The tools and the file lists authored by me are licensed under the Creative Commons Attribution-ShareAlike 4.0 International license.

Other files included here are licensed under their own respective licenses.
