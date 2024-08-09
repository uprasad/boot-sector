## Handwritten boot image

* 0xe9, 0xfd and 0xff are machine code instructions to perform an endless jump.
* The last two bytes, 0x55 and 0xaa are magic numbers that tell the BIOS that
  this is a boot block.
* The middle is padded with zeros to position the magic number at the end of
  the 512 byte BIOS disk sector.
