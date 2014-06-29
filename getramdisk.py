with open("boot.img", "rb") as infile:
	indata = infile.read()

foundindex = indata.find(bytes([0x1f, 0x8b, 0x08]))
foundindex = indata.find(bytes([0x1f, 0x8b, 0x08]), foundindex + 3)

with open("ramdisk.img", "wb") as outfile:
	outfile.write(indata[foundindex:])
