# Assembly-language boot sector

`boot.asm` is an assembly language program to write 'Hello' to the screen. This
makes the use of the 0x10 interrupt code to display characters on the screen.

Setting `ah` to 0x0e indicates tele-type mode, and `al` is used to indicate the
ASCII code of the character to be written.
