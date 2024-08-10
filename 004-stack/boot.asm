; A simple boot sector program that demonstrates the stack.

mov ah, 0x0e

; Set the stack base away from where the BIOS loads our program
mov bp, 0x8000
; Set the stack top
mov sp, bp

; Push some characters into the stack
; These are pushed as 16-bit values
push '1'  ; Written to 0x7ffe
push '2'  ; Written to 0x7ffc
push '3'  ; Written to 0x7ffa

; We can only pop 16-bit values, so pop to bx
; and move the lower 8 bits to al for printing
pop bx
mov al, bl
int 0x10

; Pop the next value
pop bx
mov al, bl
int 0x10

; Direct address to show that we know how the stack grows
mov al, [0x7ffe]
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
