Command to generate boot disk image from assembly file
```bash
nasm boot.asm -f bin -o boot.bin
```

Command to view the hexdump of a binary
```bash
xxd boot_nasm.bin
```

Command to run the program with Qemu x86 CPU
```bash
qemu-system-i386 /path/to/boot.bin
```
