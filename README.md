# John Conway's Game of Life in a boot sector

Working up from the basics, we implement John Conway's Game of Life in x86 assembly. The program fits compiles to under 512 bytes, fits in a boot sector and can be loaded by the BIOS.

The program runs Game of Life up to 50 generations in a 16x32 grid. The seed population is currently hardcoded in [seed_game_of_life.asm](008-game-of-life/seed_game_of_life.asm)

![](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExbGY5dXkydHFnaGZnYWU3bzF5aTZkOTJrN3MwYTYzamxuZm95NjlydSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/7IUa7cP3Ky1ANA5iOR/giphy.gif)

## Useful commands
Generate boot disk image from assembly file
```bash
nasm -i dir/ dir/boot.asm -f bin -o dir/boot.bin
```
View the hexdump of a binary
```bash
xxd dir/boot.bin
```
Run the program with Qemu x86 CPU
```bash
qemu-system-i386 dir/boot.bin
```
