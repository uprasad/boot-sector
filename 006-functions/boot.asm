; A boot sector program that prints a string using a function

[org 0x7c00]  ; Tell the assembler where this code will be loaded

; bx is used as the function parameter and will contain the
; address of the string to print
mov bx, HI_STRING
call print_string

mov bx, SEP_STRING
call print_string

mov bx, BYE_STRING
call print_string

jmp $

%include "print_string.asm"

; Data
HI_STRING:
  db 'Sup dawg', 0  ; 0 at the end to decide when to stop
SEP_STRING:
  db '... ', 0
BYE_STRING:
  db 'Cya dude!', 0

; $ is the address of the current instruction.
; $$ is the address of the first instruction in this section.
; db or 'direct byte' places a byte at this location
times 510-($-$$) db 0

; dw is 'direct word'
; Last two words are the magic number to let the BIOS know that this is a boot
; sector.
dw 0xaa55
