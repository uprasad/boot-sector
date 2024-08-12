Command to generate boot disk image from assembly file
```bash
nasm -i dir/ dir/boot.asm -f bin -o dir/boot.bin
```

Command to view the hexdump of a binary
```bash
xxd dir/boot.bin
```

Command to run the program with Qemu x86 CPU
```bash
qemu-system-i386 dir/boot.bin
```
