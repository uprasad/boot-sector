; A simple boot sector program that demonstrates branching

mov bx, 40
mov al, 'C'  ; Default character to print to screen

; Compare bx with 4
cmp bx, 4
; bx <= 4
jle bx_le_4
; Compare bx with 40
cmp bx, 40
; bx < 40
jl bx_less_40
jmp bx_else

bx_le_4:
  mov al, 'A'
  jmp bx_else
bx_less_40:
  mov al, 'B'
bx_else:

mov ah, 0x0e
int 0x10

jmp $

; $ is the address of the current instruction.
; $$ is the address of the first instruction in this section.
; db or 'direct byte' places a byte at this location
times 510-($-$$) db 0

; dw is 'direct word'
; Last two words are the magic number to let the BIOS know that this is a boot
; sector.
dw 0xaa55
