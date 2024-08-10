; A simple boot sector program that demonstrates addressing.

mov ah, 0x0e

mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10
add bx, 0x2
mov al, [bx]
int 0x10

jmp $

the_secret:
  db 'XYZ'

; $ is the address of the current instruction.
; $$ is the address of the first instruction in this section.
; db or 'direct byte' places a byte at this location
times 510-($-$$) db 0

; dw is 'direct word'
; Last two words are the magic number to let the BIOS know that this is a boot
; sector.
dw 0xaa55
